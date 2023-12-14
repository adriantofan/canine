module Main exposing (..)

import Assets
import Browser exposing (Document)
import Browser.Navigation as Nav
import Cmd.Extra as Cmd
import Conversations
import Home
import Html exposing (Html, a, aside, div, text)
import Html.Attributes as Attr
import Paginated
import Store
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>))


type alias Model =
    { page : Page, key : Nav.Key, store : Store.Store }


type Msg
    = ClickedLink Browser.UrlRequest
    | ChangedUrl Url
    | StoreMsg Store.Msg


type Page
    = HomePage
    | ConversationPage
    | NotFound


type Route
    = Home
    | Conversations (Maybe Int)
    | NotFoundRoute


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        route =
            routeFromUrl url

        store =
            Store.init

        requests : List Store.Action
        requests =
            dataRequests store route

        page =
            case route of
                Home ->
                    HomePage

                Conversations maybeId ->
                    ConversationPage

                NotFoundRoute ->
                    NotFound
    in
    { page = page, key = key, store = store }
        |> sendDataRequests requests


conversationConfig : Conversations.Config Msg
conversationConfig =
    { loadPrevMsg = StoreMsg (Store.ConversationMsg Paginated.OnPrevPage) }


view : Model -> Document Msg
view model =
    let
        content =
            case model.page of
                HomePage ->
                    Home.view

                ConversationPage ->
                    Conversations.view conversationConfig model.store

                NotFound ->
                    text "Not Found"
    in
    { title = "Elm Chat"
    , body =
        [ aside
            [ Attr.class "flex"
            ]
            [ navBar model.page
            , content
            ]
        ]
    }


navBar : Page -> Html Msg
navBar page =
    let
        sidebarIcon : String -> Html msg -> Html msg
        sidebarIcon path icon =
            let
                selected =
                    isActive path page
            in
            a
                [ Attr.href path
                , if selected then
                    Attr.class "rounded-lg bg-blue-100 p-1.5 text-blue-600 transition-colors duration-200 dark:bg-slate-800 dark:text-blue-600"

                  else
                    Attr.class "rounded-lg p-1.5 text-slate-500 transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:text-slate-400 dark:hover:bg-slate-800"
                ]
                [ icon ]
    in
    {- First Column -}
    div
        [ Attr.class "flex h-screen w-12 flex-col items-center space-y-8 border-r border-slate-300 bg-slate-50 py-8 dark:border-slate-700 dark:bg-slate-900 sm:w-16"
        ]
        [ {- Logo -}
          a
            [ Attr.href "#"
            , Attr.class "mb-1"
            ]
            [ Assets.logoSvg ]

        --, {- New conversation -} sidebarIcon "/new-conversation" Assets.newConversationSvg False
        , {- Conversations -} sidebarIcon "/conversations" Assets.conversationSvg

        --, {- Discover -} sidebarIcon "/discover" Assets.discoverSvg False
        --, {- User -} sidebarIcon "/user" Assets.userSvg False
        --, {- Settings -} sidebarIcon "/settings" Assets.settingsSvg False
        ]


isActive : String -> Page -> Bool
isActive path page =
    case ( path, page ) of
        ( "/", HomePage ) ->
            True

        ( "/conversations", ConversationPage ) ->
            True

        ( _, _ ) ->
            False


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StoreMsg storeMsg ->
            let
                ( newStore, storeCmd ) =
                    model.store
                        |> Store.update storeMsg

                requests : List Store.Action
                requests =
                    dataRequestsPage newStore model.page
            in
            ( { model | store = newStore }
            , Cmd.map StoreMsg storeCmd
            )
                |> Cmd.andThen (sendDataRequests requests)

        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ChangedUrl url ->
            let
                newRoute : Route
                newRoute =
                    routeFromUrl url

                requests : List Store.Action
                requests =
                    dataRequests model.store newRoute

                -- TODO: does it really make sense to have a page model ?
                page =
                    case newRoute of
                        Home ->
                            HomePage

                        Conversations maybeId ->
                            ConversationPage

                        NotFoundRoute ->
                            NotFound
            in
            ( { model | page = page }
            , Cmd.none
            )
                |> Cmd.andThen (sendDataRequests requests)


sendDataRequest : Store.Action -> Model -> ( Model, Cmd Msg )
sendDataRequest request model =
    let
        ( newStore, storeCmd ) =
            model.store
                |> Store.runAction request
    in
    ( { model | store = newStore }
    , Cmd.map StoreMsg storeCmd
    )


sendDataRequests : List Store.Action -> Model -> ( Model, Cmd Msg )
sendDataRequests requests model =
    List.foldl
        (\request modelAndCmd ->
            modelAndCmd
                |> Cmd.andThen (sendDataRequest request)
        )
        ( model, Cmd.none )
        requests


dataRequests : Store.Store -> Route -> List Store.Action
dataRequests store route =
    -- TODO: OBSOLETE: use dataRequestsPage instead
    case route of
        Home ->
            []

        Conversations maybeId ->
            case maybeId of
                Just id ->
                    Debug.todo "get specific conversation"

                Nothing ->
                    Conversations.dataRequests store

        NotFoundRoute ->
            []


dataRequestsPage : Store.Store -> Page -> List Store.Action
dataRequestsPage store page =
    -- TODO: replace url based dataRequests with dataRequestsPage
    case page of
        HomePage ->
            []

        ConversationPage ->
            Conversations.dataRequests store

        NotFound ->
            []


parser : Parser.Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Home Parser.top
        , Parser.map (Conversations Nothing) (Parser.s "conversations")
        , Parser.map conversationWithId (Parser.s "conversation" </> Parser.int)
        ]


conversationWithId id =
    Conversations (Just id)


routeFromUrl : Url -> Route
routeFromUrl url =
    Parser.parse parser url
        |> Maybe.withDefault NotFoundRoute


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , onUrlRequest = ClickedLink
        , onUrlChange = ChangedUrl
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
