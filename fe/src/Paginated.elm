module Paginated exposing (Action(..), Model, Msg(..), init, prevConversationPage, runAction, update)

import Api exposing (Conversation, ConversationId, ConversationPage, getConversationPage)
import Http
import RemoteData exposing (RemoteData(..), WebData)


type alias Model =
    { data : List Conversation
    , lastPage : WebData ConversationPage
    , lastId : Maybe ConversationId -- last known conversation id, got from the previous Success of lastConversationPage
    }


type Action
    = PrevPage (Maybe ConversationId) -- last known conversation id


type
    Msg
    -- Todo: rename in previous
    = OnPrevRetrieved (Maybe ConversationId) ConversationPage
    | OnPrevPage
    | LoadError Action Http.Error


init : Model
init =
    { data = []
    , lastPage = NotAsked
    , lastId = Nothing
    }


prevConversationPage : Model -> Action
prevConversationPage store =
    PrevPage <| prevConversationPageId store


runAction : Action -> Model -> ( Model, Cmd Msg )
runAction action store =
    case action of
        PrevPage id ->
            if shouldSendRequest store.lastPage then
                ( { store | lastPage = Loading }
                , send action (getConversationPage id) (OnPrevRetrieved id)
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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg store =
    case msg of
        OnPrevRetrieved afterId conversationPage ->
            if prevConversationPageId store == afterId then
                ( { store
                    | data = store.data ++ conversationPage.data
                    , lastPage = Success conversationPage
                    , lastId =
                        if List.isEmpty store.data then
                            Just conversationPage.next
                            -- TODO: we could disable load more button here

                        else
                            store.lastId
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

        OnPrevPage ->
            let
                shouldRefresh =
                    case store.lastPage of
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
                ( { store | lastPage = NotAsked }, Cmd.none )

            else
                ( store, Cmd.none )


saveFailure : Action -> Http.Error -> Model -> Model
saveFailure action err store =
    case action of
        PrevPage id ->
            if prevConversationPageId store == id then
                { store | lastPage = Failure err }

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


prevConversationPageId : Model -> Maybe ConversationId
prevConversationPageId store =
    store.lastId
