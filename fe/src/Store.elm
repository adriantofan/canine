module Store exposing (Action(..), Msg(..), Store, getConversations, getMessages, getOngoing, init, isSending, prevConversationPage, prevMessagePage, runAction, update, updateConversation)

import Api exposing (Conversation, ConversationId, ConversationPage, CreateMessagePayload, Message, MessageId, MessagePage, getConversationPage, getMessagePage)
import Dict exposing (Dict, get, insert)
import Either exposing (Either(..))
import Http
import Json.Decode
import Json.Encode
import Paginated
import Time


type alias Store =
    { conversations : Paginated.Model Conversation ConversationId
    , messages : Maybe ( ConversationId, Paginated.Model Message MessageId )
    , ongoing : Dict ConversationId (FormData NewMessage)
    , userId : String
    }


type alias NewMessage =
    { content : String }


type FormData d
    = Sending d
    | Editing d


type Action
    = ConversationAction (Paginated.Action ConversationId)
    | MessageAction ConversationId (Paginated.Action MessageId)
    | CreateMessageAction ConversationId


type Msg
    = ConversationMsg (Paginated.Msg ConversationId ConversationPage)
    | MessageMsg ConversationId (Paginated.Msg MessageId MessagePage)
    | CreatedMessageMsg ConversationId (Result Http.Error Message)
    | ChangeOngoingMessage ConversationId NewMessage
    | GotSSM Json.Encode.Value


init : Maybe ConversationId -> Store
init conversationId =
    { conversations = Paginated.init
    , messages =
        case conversationId of
            Just id ->
                Just ( id, Paginated.init )

            Nothing ->
                Nothing
    , ongoing = Dict.empty
    , userId = "13"
    }


updateConversation : Store -> Maybe ConversationId -> Store
updateConversation store newConversationId =
    case store.messages of
        Just ( conversationId, _ ) ->
            case newConversationId of
                Just id ->
                    if id == conversationId then
                        store

                    else
                        { store | messages = Just ( conversationId, Paginated.init ) }

                Nothing ->
                    { store | messages = Nothing }

        Nothing ->
            case newConversationId of
                Just id ->
                    { store | messages = Just ( id, Paginated.init ) }

                Nothing ->
                    store


prevConversationPage : Store -> Action
prevConversationPage store =
    ConversationAction (Paginated.PrevPage <| prevConversationPageId store)


prevMessagePage : ConversationId -> Store -> List Action
prevMessagePage conversationId store =
    [ MessageAction conversationId (Paginated.PrevPage (prevMessagePageId store)) ]


conversationsConfig : Paginated.Config Conversation ConversationId ConversationPage
conversationsConfig =
    { fetchPrev = getConversationPage
    , data = .data
    , nextId = .next
    }


messagesConfig : ConversationId -> Paginated.Config Message MessageId MessagePage
messagesConfig conversationId =
    { fetchPrev = getMessagePage conversationId
    , data = .data
    , nextId = .next
    }


runAction : Action -> Store -> ( Store, Cmd Msg )
runAction action store =
    case action of
        ConversationAction conversationAction ->
            let
                ( conversation, cmd ) =
                    Paginated.runAction conversationsConfig conversationAction store.conversations
            in
            ( { store | conversations = conversation }, Cmd.map ConversationMsg cmd )

        MessageAction actionConversationId messageAction ->
            case store.messages of
                Just ( conversationId, messages ) ->
                    if actionConversationId /= conversationId then
                        -- unclear if need to check conversation id
                        Debug.log "Action conversation id different from store" ( store, Cmd.none )

                    else
                        let
                            ( message, cmd ) =
                                Paginated.runAction (messagesConfig conversationId) messageAction messages
                        in
                        ( { store | messages = Just ( conversationId, message ) }, Cmd.map (\x -> MessageMsg conversationId x) cmd )

                Nothing ->
                    ( store, Cmd.none )

        CreateMessageAction conversationId ->
            case Dict.get conversationId store.ongoing of
                Just (Sending _) ->
                    -- Impossible states are possible ...
                    Debug.log ("Already sending" ++ conversationId) ( store, Cmd.none )

                Just (Editing m) ->
                    let
                        payload =
                            { conversationId = conversationId, message = m.content, senderId = store.userId }

                        cmd =
                            Api.createMessage payload identity

                        ongoing =
                            updateOngoingSetSend store conversationId
                    in
                    ( { store | ongoing = ongoing }, Cmd.map (\x -> CreatedMessageMsg conversationId x) cmd )

                Nothing ->
                    -- Impossible states are possible ...
                    Debug.log ("No ongoing" ++ conversationId) ( store, Cmd.none )


isSending : Store -> ConversationId -> Bool
isSending store conversationId =
    case get conversationId store.ongoing of
        Just (Sending _) ->
            True

        _ ->
            False


updateOngoingSetSend : Store -> ConversationId -> Dict ConversationId (FormData NewMessage)
updateOngoingSetSend store conversationId =
    case get conversationId store.ongoing of
        Just (Sending _) ->
            -- Impossible states are possible ..
            Debug.log ("Already sending" ++ conversationId) store.ongoing

        Just (Editing m) ->
            insert conversationId (Sending m) store.ongoing

        Nothing ->
            -- Impossible states are possible ...
            Debug.log ("No ongoing" ++ conversationId) store.ongoing


updateOngoing : Store -> ConversationId -> NewMessage -> Dict ConversationId (FormData NewMessage)
updateOngoing store conversationId msg =
    case get conversationId store.ongoing of
        Just (Sending _) ->
            -- Impossible states are possible ...
            Debug.log ("Already sending" ++ conversationId) store.ongoing

        _ ->
            insert conversationId (Editing msg) store.ongoing


getOngoing : Store -> ConversationId -> Maybe NewMessage
getOngoing store conversationId =
    case get conversationId store.ongoing of
        Just (Sending m) ->
            -- Impossible states are possible ...
            Just m

        Just (Editing m) ->
            Just m

        Nothing ->
            Nothing


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        GotSSM json ->
            let
                maybeUpdate =
                    Json.Decode.decodeValue Api.decodeUpdate json

                newStore =
                    case maybeUpdate of
                        Ok u ->
                            updateSSE store u

                        Err e ->
                            Debug.log (Json.Decode.errorToString e) store
            in
            ( newStore, Cmd.none )

        ConversationMsg conversationMsg ->
            let
                ( conversation, cmd ) =
                    Paginated.update conversationsConfig conversationMsg store.conversations
            in
            ( { store | conversations = conversation }, Cmd.map ConversationMsg cmd )

        -- Cmd.none was Cmd.map ConversationMsg cmd
        MessageMsg msgConversationId messageMsg ->
            case store.messages of
                Just ( conversationId, messages ) ->
                    if msgConversationId /= conversationId then
                        -- unclear if need to check conversation id
                        Debug.log "Msg conversation id different from store" ( store, Cmd.none )

                    else
                        let
                            ( message, cmd ) =
                                Paginated.update (messagesConfig conversationId) messageMsg messages
                        in
                        ( { store | messages = Just ( conversationId, message ) }, Cmd.map (\x -> MessageMsg conversationId x) cmd )

                -- Cmd.none was Cmd.map (\x -> MessageMsg conversationId x) cmd
                Nothing ->
                    ( store, Cmd.none )

        CreatedMessageMsg conversationID result ->
            case result of
                Ok message ->
                    let
                        ongoing =
                            insert message.conversationId (Editing { content = "" }) store.ongoing
                    in
                    ( { store | ongoing = ongoing }, Cmd.none )

                Err _ ->
                    let
                        ongoing =
                            Dict.update conversationID
                                (\x ->
                                    case x of
                                        Just (Sending m) ->
                                            -- make it editable again for the moment
                                            Just (Editing m)

                                        _ ->
                                            -- Impossible states are possible ...
                                            Debug.log ("No ongoing in Err for CreatedMessageMsg" ++ conversationID) Nothing
                                )
                                store.ongoing
                    in
                    ( { store | ongoing = ongoing }, Cmd.none )

        ChangeOngoingMessage conversationId newMessage ->
            let
                ongoing =
                    updateOngoing store conversationId newMessage
            in
            ( { store | ongoing = ongoing }, Cmd.none )


updateSSE : Store -> Api.Update -> Store
updateSSE store u =
    case Debug.log "UpdateSSe" u of
        Api.MessageUpdate m ->
            case store.messages of
                Just ( conversationId, messages ) ->
                    if m.conversationId == conversationId then
                        let
                            newMessages =
                                Paginated.updateWithNewItems cmpUpdatedMessage messages [ m ]
                        in
                        { store | messages = Just ( conversationId, newMessages ) }

                    else
                        store

                Nothing ->
                    store


cmpUpdatedMessage : Message -> Message -> Either Paginated.StrictOrder Message
cmpUpdatedMessage old new =
    if old.id == new.id then
        let
            oldTime =
                Time.posixToMillis old.createdAt

            newTime =
                Time.posixToMillis new.createdAt
        in
        if newTime >= oldTime then
            Right new

        else
            Right old

    else if old.id > new.id then
        Left Paginated.LT

    else
        Left Paginated.GT


prevConversationPageId : Store -> Maybe ConversationId
prevConversationPageId store =
    store.conversations.nextIdToLoad


prevMessagePageId : Store -> Maybe MessageId
prevMessagePageId store =
    case store.messages of
        Just ( _, messages ) ->
            messages.nextIdToLoad

        Nothing ->
            Nothing


getConversations : Store -> List Conversation
getConversations store =
    store.conversations.data


getMessages : Store -> List Message
getMessages store =
    case store.messages of
        Just ( _, messages ) ->
            List.reverse messages.data

        Nothing ->
            []
