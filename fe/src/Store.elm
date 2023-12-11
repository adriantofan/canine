module Store exposing (Action(..), Conversation, ConversationStore, Data(..), Model, Msg(..), Requested(..), init, runAction, update)

import Http
import Json.Decode exposing (Decoder, field, int, list, map2, string)


type alias ConversationStore =
    Data ConversationPage Requested


type alias Model =
    { conversations : ConversationStore
    }


type alias ConversationPage =
    { data : List Conversation
    , next : Int
    }


type Action
    = NextConversationPage (Maybe Int) -- always request Nothing ...


type Data state status
    = Unknown status -- not yet known, not yet requested etc.
    | HaveData state status


type Requested
    = NotLoading
    | Loading
    | Failed


type alias Conversation =
    { id : Int
    , name : String
    }


type Msg
    = OnConversationsRetrieved ConversationPage
    | LoadError Action Http.Error


init : Model
init =
    { conversations = Unknown NotLoading
    }


runAction : Action -> Model -> ( Model, Cmd Msg )
runAction action store =
    case action of
        NextConversationPage _ ->
            -- kind of sucks that the page id is built in needUpdateConversationPage
            -- maybe split in to action and action payload?
            let
                ( conversations, cmd ) =
                    needUpdateConversationPage store.conversations
            in
            ( { store | conversations = conversations }
            , cmd
            )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg store =
    case msg of
        OnConversationsRetrieved page ->
            let
                conversations =
                    case store.conversations of
                        Unknown _ ->
                            HaveData page NotLoading

                        HaveData _ _ ->
                            HaveData page NotLoading
            in
            ( { store | conversations = conversations }, Cmd.none )

        LoadError _ _ ->
            let
                conversations =
                    case store.conversations of
                        Unknown _ ->
                            Unknown Failed

                        HaveData page _ ->
                            HaveData page Failed
            in
            ( { store | conversations = conversations }, Cmd.none )


needUpdateConversationPage : Data ConversationPage Requested -> ( Data ConversationPage Requested, Cmd Msg )
needUpdateConversationPage crt =
    case crt of
        Unknown state ->
            case state of
                -- should not have next page here :shrug:
                NotLoading ->
                    ( Unknown Loading, send (NextConversationPage Nothing) )

                Loading ->
                    ( crt, Cmd.none )

                Failed ->
                    ( Unknown Loading, send (NextConversationPage Nothing) )

        HaveData page state ->
            case state of
                NotLoading ->
                    ( HaveData page Loading, send (NextConversationPage (Just page.next)) )

                Loading ->
                    ( crt, Cmd.none )

                Failed ->
                    ( HaveData page Loading, send (NextConversationPage (Just page.next)) )



-- DECODERS - API


conversationDecoder : Decoder Conversation
conversationDecoder =
    map2 Conversation
        (field "id" int)
        (field "name" string)


conversationPageDecoder : Decoder ConversationPage
conversationPageDecoder =
    map2 ConversationPage
        (field "conversations" (list conversationDecoder))
        (field "next" int)


send : Action -> Cmd Msg
send action =
    case action of
        NextConversationPage _ ->
            -- TODO: inject next page id in the payload
            Http.get
                -- TODO: inject the api url somehow
                { url = "http://localhost:1234/api/tmp-conversations"
                , expect = Http.expectJson (jsonToMsg action OnConversationsRetrieved) conversationPageDecoder
                }


jsonToMsg : Action -> (a -> Msg) -> (Result Http.Error a -> Msg)
jsonToMsg action success =
    \result ->
        case result of
            Err err ->
                LoadError action err

            Ok page ->
                success page
