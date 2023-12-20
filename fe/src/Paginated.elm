module Paginated exposing (Action(..), Config, Model, Msg(..), StrictOrder(..), init, runAction, update, updateWithNewItems)

import Either exposing (Either(..))
import Http
import RemoteData exposing (RemoteData(..), WebData)


type alias Model item itemId =
    { data : List item
    , loadingId : WebData ()
    , nextIdToLoad : Maybe itemId
    }


type Action itemId
    = PrevPage (Maybe itemId) -- last loaded conversation id


type Msg itemId page
    = OnPrevRetrieved page
    | OnPrevPage
    | LoadError (Action itemId) Http.Error


init : Model item itemId
init =
    { data = []
    , loadingId = NotAsked
    , nextIdToLoad = Nothing
    }


type alias Config item itemId page =
    { fetchPrev : Maybe itemId -> (Result Http.Error page -> Msg itemId page) -> Cmd (Msg itemId page)
    , data : page -> List item
    , nextId : page -> itemId
    }


runAction : Config item itemId page -> Action itemId -> Model item itemId -> ( Model item itemId, Cmd (Msg itemId page) )
runAction config action store =
    case action of
        PrevPage id ->
            if shouldSendRequest store.loadingId then
                ( { store | loadingId = Loading }
                , send action (config.fetchPrev id) OnPrevRetrieved
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


update : Config item itemId page -> Msg itemId page -> Model item itemId -> ( Model item itemId, Cmd (Msg itemId page) )
update config msg store =
    case msg of
        OnPrevRetrieved page ->
            ( { store
                | data = store.data ++ config.data page
                , loadingId = Success ()
                , nextIdToLoad =
                    if not (List.isEmpty (config.data page)) then
                        Just <| config.nextId page
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


updateWithNewItems : (item -> item -> Either StrictOrder item) -> Model item itemId -> List item -> Model item itemId
updateWithNewItems cmp store newData =
    { store | data = mergeUpdateSortedListsWith cmp store.data newData }


saveFailure : Action itemId -> Http.Error -> Model item itemId -> Model item itemId
saveFailure action err store =
    case action of
        PrevPage id ->
            if store.nextIdToLoad == id then
                { store | loadingId = Failure err }

            else
                store


send : Action itemId -> ((Result Http.Error a -> Msg itemId page) -> Cmd (Msg itemId page)) -> (a -> Msg itemId page) -> Cmd (Msg itemId page)
send action toCmd toSuccessMsg =
    toCmd
        (\result ->
            case result of
                Err err ->
                    LoadError action err

                Ok success ->
                    toSuccessMsg success
        )


mergeUpdateSortedListsWith : (a -> a -> Either StrictOrder a) -> List a -> List a -> List a
mergeUpdateSortedListsWith cmp list1 list2 =
    case ( list1, list2 ) of
        ( [], _ ) ->
            list2

        ( _, [] ) ->
            list1

        ( x :: xs, y :: ys ) ->
            case cmp x y of
                Left LT ->
                    x :: mergeUpdateSortedListsWith cmp xs (y :: ys)

                Right newer ->
                    newer :: mergeUpdateSortedListsWith cmp xs ys

                Left GT ->
                    y :: mergeUpdateSortedListsWith cmp (x :: xs) ys


type StrictOrder
    = LT
    | GT
