module Store exposing (Action(..), Msg(..), Store, getConversations, getMessages, init, prevConversationPage, prevMessagePage, runAction, update, updateConversation)

import Api exposing (Conversation, ConversationId, ConversationPage, Message, MessageId, MessagePage, getConversationPage, getMessagePage)
import Paginated


type alias Store =
    { conversations : Paginated.Model Conversation ConversationId
    , messages : Maybe ( ConversationId, Paginated.Model Message MessageId )
    }


type Action
    = ConversationAction (Paginated.Action ConversationId)
    | MessageAction ConversationId (Paginated.Action MessageId)


type Msg
    = ConversationMsg (Paginated.Msg ConversationId ConversationPage)
    | MessageMsg ConversationId (Paginated.Msg MessageId MessagePage)


init : Maybe ConversationId -> Store
init conversationId =
    { conversations = Paginated.init
    , messages =
        case conversationId of
            Just id ->
                Just ( id, Paginated.init )

            Nothing ->
                Nothing
    }


updateConversation : Store -> Maybe ConversationId -> Store
updateConversation store newConversationId =
    case store.messages of
        Just ( conversationId, messages ) ->
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


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        ConversationMsg conversationMsg ->
            let
                ( conversation, cmd ) =
                    Paginated.update conversationsConfig conversationMsg store.conversations
            in
            ( { store | conversations = conversation }, Cmd.none )

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
                        ( { store | messages = Just ( conversationId, message ) }, Cmd.none )

                -- Cmd.none was Cmd.map (\x -> MessageMsg conversationId x) cmd
                Nothing ->
                    ( store, Cmd.none )


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
