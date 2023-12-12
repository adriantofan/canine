module Store exposing (Action(..), Msg(..), Store, init, prevConversationPage, runAction, update)

import Api exposing (Conversation, ConversationId, ConversationPage, getConversationPage)
import Http
import RemoteData exposing (RemoteData(..), WebData)


type alias Store =
    { conversations : List Conversation
    , lastConversationPage : WebData ConversationPage
    }


type Action
    = PrevConversationPage (Maybe ConversationId) -- last known conversation id


type
    Msg
    -- Todo: rename in previous
    = OnPrevConversationsRetrieved (Maybe ConversationId) ConversationPage
    | OnPrevConversationPage
    | LoadError Action Http.Error


init : Store
init =
    { conversations = []
    , lastConversationPage = NotAsked
    }


prevConversationPage : Store -> Action
prevConversationPage store =
    PrevConversationPage <| prevConversationPageId store


runAction : Action -> Store -> ( Store, Cmd Msg )
runAction action store =
    case action of
        PrevConversationPage id ->
            if shouldSendRequest store.lastConversationPage then
                ( { store | lastConversationPage = Loading }
                , send action (getConversationPage id) (OnPrevConversationsRetrieved id)
                )

            else
                ( store, Cmd.none )


shouldSendRequest : WebData a -> Bool
shouldSendRequest webdata =
    case webdata of
        NotAsked ->
            True

        Loading ->
            False

        Failure _ ->
            False

        Success _ ->
            False


shouldSendRequest_ : Maybe (WebData a) -> Bool
shouldSendRequest_ maybeWebData =
    case maybeWebData of
        Nothing ->
            True

        Just webData ->
            shouldSendRequest webData


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        OnPrevConversationsRetrieved afterId conversationPage ->
            if prevConversationPageId store == afterId then
                ( { store
                    | conversations = store.conversations ++ conversationPage.data
                    , lastConversationPage = Success conversationPage
                  }
                , Cmd.none
                )

            else
                Debug.log "Discarding stale API response for conversation page"
                    ( store, Cmd.none )

        LoadError action err ->
            ( saveFailure action err store
            , Cmd.none
            )

        OnPrevConversationPage ->
            let
                shouldRefresh =
                    case store.lastConversationPage of
                        NotAsked ->
                            True

                        Loading ->
                            False

                        Failure _ ->
                            True

                        Success _ ->
                            True
            in
            if shouldRefresh then
                ( { store | lastConversationPage = NotAsked }, Cmd.none )

            else
                ( store, Cmd.none )


saveFailure : Action -> Http.Error -> Store -> Store
saveFailure action err store =
    case action of
        PrevConversationPage id ->
            if prevConversationPageId store == id then
                { store | lastConversationPage = Failure err }

            else
                store


send : Action -> ((Result Http.Error a -> Msg) -> Cmd Msg) -> (a -> Msg) -> Cmd Msg
send action toCmd toSuccessMsg =
    toCmd
        (\result ->
            case result of
                Err err ->
                    LoadError action err

                Ok success ->
                    toSuccessMsg success
        )



-- HELPERS


prevConversationPageId : Store -> Maybe ConversationId
prevConversationPageId store =
    store.lastConversationPage |> RemoteData.toMaybe |> Maybe.andThen (\page -> Just page.next)
