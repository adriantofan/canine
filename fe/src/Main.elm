module Main exposing (..)

import Assets
import Browser exposing (Document)
import Browser.Navigation as Nav
import Conversations
import Home
import Html exposing (Html, a, aside, div, text)
import Html.Attributes as Attr
import Store
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>))


type alias Model =
    { page : Page, key : Nav.Key, store : Store.Model }


type Page
    = HomePage Home.Model
    | ConversationPage Conversations.Model
    | NotFound


type Route
    = Home
    | Conversations (Maybe Int)


view : Model -> Document Msg
view model =
    let
        content =
            case model.page of
                HomePage home ->
                    Home.view home |> Html.map HomeMsg

                ConversationPage conversations ->
                    Conversations.view model.store conversations |> Html.map ConversationsMsg

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
        ( "/", HomePage _ ) ->
            True

        ( "/conversations", ConversationPage _ ) ->
            True

        ( _, _ ) ->
            False


type Msg
    = ClickedLink Browser.UrlRequest
    | ChangedUrl Url
    | HomeMsg Home.Msg
    | ConversationsMsg Conversations.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ChangedUrl url ->
            updateUrl url model

        HomeMsg homeMsg ->
            case model.page of
                HomePage home ->
                    toHome model (Home.update homeMsg home)

                _ ->
                    ( model, Cmd.none )

        ConversationsMsg conversationsMsg ->
            case model.page of
                ConversationPage conversations ->
                    toConversations model (Conversations.update conversationsMsg conversations)

                _ ->
                    ( model, Cmd.none )


updateUrl : Url -> Model -> ( Model, Cmd Msg )
updateUrl url model =
    case Parser.parse parser url of
        Just Home ->
            toHome model Home.init

        Just (Conversations maybeId) ->
            toConversations model (Conversations.init maybeId)

        Nothing ->
            ( { model | page = NotFound }, Cmd.none )


parser : Parser.Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Home Parser.top
        , Parser.map (Conversations Nothing) (Parser.s "conversations")
        , Parser.map conversationWithId (Parser.s "conversation" </> Parser.int)
        ]



-- just used to partially apply the route constructor


conversationWithId id =
    Conversations (Just id)


toHome : Model -> ( Home.Model, Cmd Home.Msg ) -> ( Model, Cmd Msg )
toHome model ( homeModel, homeCmd ) =
    ( { model | page = HomePage homeModel }, Cmd.map HomeMsg homeCmd )


toConversations : Model -> ( Conversations.Model, Cmd Conversations.Msg ) -> ( Model, Cmd Msg )
toConversations model ( conversationsModel, conversationsCmd ) =
    ( { model | page = ConversationPage conversationsModel }, Cmd.map ConversationsMsg conversationsCmd )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    updateUrl url { page = NotFound, key = key, store = Store.init }


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
