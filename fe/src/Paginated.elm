module Paginated exposing (Action(..), Model, Msg(..), init, runAction, update)

import Api exposing (Conversation, ConversationId, ConversationPage, getConversationPage)
import Http
import RemoteData exposing (RemoteData(..), WebData)


type alias Model =
    { data : List Conversation
    , loadingId : WebData ()
    , nextIdToLoad : Maybe ConversationId
    }


type Action
    = PrevPage (Maybe ConversationId) -- last loaded conversation id


type Msg
    = OnPrevRetrieved ConversationPage
    | OnPrevPage
    | LoadError Action Http.Error


init : Model
init =
    { data = []
    , loadingId = NotAsked
    , nextIdToLoad = Nothing
    }


runAction : Action -> Model -> ( Model, Cmd Msg )
runAction action store =
    case action of
        PrevPage id ->
            if shouldSendRequest store.loadingId then
                ( { store | loadingId = Loading }
                , send action (getConversationPage id) OnPrevRetrieved
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
        OnPrevRetrieved conversationPage ->
            ( { store
                | data = store.data ++ conversationPage.data
                , loadingId = Success ()
                , nextIdToLoad =
                    if List.isEmpty store.data then
                        Just conversationPage.next
                        -- TODO: we could disable load more button here

                    else
                        store.nextIdToLoad
              }
            , Cmd.none
            )

        LoadError action err ->
            ( saveFailure action err store
            , Cmd.none
            )

        OnPrevPage ->
            let
                shouldRefresh =
                    case store.loadingId of
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
                ( { store | loadingId = NotAsked }, Cmd.none )

            else
                ( store, Cmd.none )


saveFailure : Action -> Http.Error -> Model -> Model
saveFailure action err store =
    case action of
        PrevPage id ->
            if prevConversationPageId store == id then
                { store | loadingId = Failure err }

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
    store.nextIdToLoad
