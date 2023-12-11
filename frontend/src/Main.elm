module Main exposing (..)

import Assets
import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes as Attr exposing (..)
import Route exposing (Route, toRoute)
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr
import Url



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , route : Route
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url (toRoute url), Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url, route = toRoute url }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "URL Interceptor"
    , body =
        [ Html.node "link" [ Attr.rel "stylesheet", Attr.href "style.css" ] []
        , sidebar model
        ]
    }


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]


sidebarIcon : String -> Html msg -> Bool -> Html msg
sidebarIcon path icon selected =
    a
        [ Attr.href path
        , if selected then
            Attr.class "rounded-lg bg-blue-100 p-1.5 text-blue-600 transition-colors duration-200 dark:bg-slate-800 dark:text-blue-600"

          else
            Attr.class "rounded-lg p-1.5 text-slate-500 transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:text-slate-400 dark:hover:bg-slate-800"
        ]
        [ icon ]


sidebar : Model -> Html msg
sidebar model =
    aside
        [ Attr.class "flex"
        ]
        [ {- First Column -}
          div
            [ Attr.class "flex h-screen w-12 flex-col items-center space-y-8 border-r border-slate-300 bg-slate-50 py-8 dark:border-slate-700 dark:bg-slate-900 sm:w-16"
            ]
            [ {- Logo -}
              a
                [ Attr.href "#"
                , Attr.class "mb-1"
                ]
                [ Assets.logoSvg ]
            , {- New conversation -} sidebarIcon "/new-conversation" Assets.newConversationSvg False
            , {- Conversations -} sidebarIcon "/conversations" Assets.conversationSvg (Route.isConversation model.route)
            , {- Discover -} sidebarIcon "/discover" Assets.discoverSvg False
            , {- User -} sidebarIcon "/user" Assets.userSvg False
            , {- Settings -} sidebarIcon "/settings" Assets.settingsSvg False
            ]
        , {- Second Column -}
          div
            [ Attr.class "h-screen w-52 overflow-y-auto bg-slate-50 py-8 dark:bg-slate-900 sm:w-60"
            ]
            [ div
                [ Attr.class "flex items-start"
                ]
                [ h2
                    [ Attr.class "inline px-5 text-lg font-medium text-slate-800 dark:text-slate-200"
                    ]
                    [ text "Chats" ]
                , span
                    [ Attr.class "rounded-full bg-blue-600 px-2 py-1 text-xs text-slate-200"
                    ]
                    [ text "24" ]
                ]
            , div
                [ Attr.class "mx-2 mt-8 space-y-4"
                ]
                [ Html.form []
                    [ label
                        [ Attr.for "chat-input"
                        , Attr.class "sr-only"
                        ]
                        [ text "Search chats" ]
                    , div
                        [ Attr.class "relative"
                        ]
                        [ input
                            [ Attr.id "search-chats"
                            , Attr.type_ "text"
                            , Attr.class "w-full rounded-lg border border-slate-300 bg-slate-50 p-3 pr-10 text-sm text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-500 dark:border-slate-700 dark:bg-slate-900 dark:text-slate-200"
                            , Attr.placeholder "Search chats"
                            , Attr.rows 1
                            , Attr.required True
                            ]
                            []
                        , button
                            [ Attr.type_ "submit"
                            , Attr.class "absolute bottom-2 right-2.5 rounded-lg p-2 text-sm text-slate-500 hover:text-blue-700 focus:outline-none sm:text-base"
                            ]
                            [ svg
                                [ SvgAttr.class "h-5 w-5"
                                , Attr.attribute "aria-hidden" "true"
                                , SvgAttr.viewBox "0 0 24 24"
                                , SvgAttr.strokeWidth "2"
                                , SvgAttr.stroke "currentColor"
                                , SvgAttr.fill "none"
                                , SvgAttr.strokeLinecap "round"
                                , SvgAttr.strokeLinejoin "round"
                                ]
                                [ path
                                    [ SvgAttr.stroke "none"
                                    , SvgAttr.d "M0 0h24v24H0z"
                                    , SvgAttr.fill "none"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M8 9h8"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M8 13h5"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M11.008 19.195l-3.008 1.805v-3h-2a3 3 0 0 1 -3 -3v-8a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v4.5"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M18 18m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0"
                                    ]
                                    []
                                , path
                                    [ SvgAttr.d "M20.2 20.2l1.8 1.8"
                                    ]
                                    []
                                ]
                            , span
                                [ Attr.class "sr-only"
                                ]
                                [ text "Search chats" ]
                            ]
                        ]
                    ]
                , button
                    [ Attr.class "flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:hover:bg-slate-800"
                    ]
                    [ h1
                        [ Attr.class "text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
                        ]
                        [ text "Tailwind Classes" ]
                    , p
                        [ Attr.class "text-xs text-slate-500 dark:text-slate-400"
                        ]
                        [ text "12 Mar" ]
                    ]
                , button
                    [ Attr.class "flex w-full flex-col gap-y-2 rounded-lg bg-slate-200 px-3 py-2 text-left transition-colors duration-200 focus:outline-none dark:bg-slate-800"
                    ]
                    [ h1
                        [ Attr.class "text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
                        ]
                        [ text "explain quantum computing" ]
                    , p
                        [ Attr.class "text-xs text-slate-500 dark:text-slate-400"
                        ]
                        [ text "10 Feb" ]
                    ]
                , button
                    [ Attr.class "flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:hover:bg-slate-800"
                    ]
                    [ h1
                        [ Attr.class "text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
                        ]
                        [ text "How to create ERP Diagram" ]
                    , p
                        [ Attr.class "text-xs text-slate-500 dark:text-slate-400"
                        ]
                        [ text "22 Jan" ]
                    ]
                , button
                    [ Attr.class "flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 hover:bg-slate-200 focus:outline-none dark:hover:bg-slate-800"
                    ]
                    [ h1
                        [ Attr.class "text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
                        ]
                        [ text "API Scaling Strategies" ]
                    , p
                        [ Attr.class "text-xs text-slate-500 dark:text-slate-400"
                        ]
                        [ text "1 Jan" ]
                    ]
                ]
            ]
        , -- Chat
          if Route.isConversation model.route then
            promptContainer

          else
            div [] []
        ]


promptMessageSystem : String -> Html msg
promptMessageSystem msg =
    {- This is a message sent by the system unseen by the user -}
    div
        [ Attr.class "flex flex-row px-2 py-4 sm:px-4"
        ]
        [ img
            [ Attr.class "mr-2 flex h-8 w-8 rounded-full sm:mr-4"
            , Attr.src "https://dummyimage.com/256x256/363536/ffffff&text=U"
            ]
            []
        , div
            [ Attr.class "flex max-w-3xl items-center"
            ]
            [ p []
                [ text msg ]
            ]
        ]


msgActionButtons =
    div
        [ Attr.class "mb-2 flex w-full flex-row justify-end gap-x-2 text-slate-500"
        ]
        [ button
            [ Attr.class "hover:text-blue-600"
            ]
            [ svg
                [ SvgAttr.class "h-5 w-5"
                , SvgAttr.viewBox "0 0 24 24"
                , SvgAttr.strokeWidth "2"
                , SvgAttr.stroke "currentColor"
                , SvgAttr.fill "none"
                , SvgAttr.strokeLinecap "round"
                , SvgAttr.strokeLinejoin "round"
                ]
                [ path
                    [ SvgAttr.stroke "none"
                    , SvgAttr.d "M0 0h24v24H0z"
                    , SvgAttr.fill "none"
                    ]
                    []
                , path
                    [ SvgAttr.d "M7 11v8a1 1 0 0 1 -1 1h-2a1 1 0 0 1 -1 -1v-7a1 1 0 0 1 1 -1h3a4 4 0 0 0 4 -4v-1a2 2 0 0 1 4 0v5h3a2 2 0 0 1 2 2l-1 5a2 3 0 0 1 -2 2h-7a3 3 0 0 1 -3 -3"
                    ]
                    []
                ]
            ]
        , button
            [ Attr.class "hover:text-blue-600"
            , Attr.type_ "button"
            ]
            [ svg
                [ SvgAttr.class "h-5 w-5"
                , SvgAttr.viewBox "0 0 24 24"
                , SvgAttr.strokeWidth "2"
                , SvgAttr.stroke "currentColor"
                , SvgAttr.fill "none"
                , SvgAttr.strokeLinecap "round"
                , SvgAttr.strokeLinejoin "round"
                ]
                [ path
                    [ SvgAttr.stroke "none"
                    , SvgAttr.d "M0 0h24v24H0z"
                    , SvgAttr.fill "none"
                    ]
                    []
                , path
                    [ SvgAttr.d "M7 13v-8a1 1 0 0 0 -1 -1h-2a1 1 0 0 0 -1 1v7a1 1 0 0 0 1 1h3a4 4 0 0 1 4 4v1a2 2 0 0 0 4 0v-5h3a2 2 0 0 0 2 -2l-1 -5a2 3 0 0 0 -2 -2h-7a3 3 0 0 0 -3 3"
                    ]
                    []
                ]
            ]
        , button
            [ Attr.class "hover:text-blue-600"
            , Attr.type_ "button"
            ]
            [ svg
                [ SvgAttr.class "h-5 w-5"
                , SvgAttr.viewBox "0 0 24 24"
                , SvgAttr.strokeWidth "2"
                , SvgAttr.stroke "currentColor"
                , SvgAttr.fill "none"
                , SvgAttr.strokeLinecap "round"
                , SvgAttr.strokeLinejoin "round"
                ]
                [ path
                    [ SvgAttr.stroke "none"
                    , SvgAttr.d "M0 0h24v24H0z"
                    , SvgAttr.fill "none"
                    ]
                    []
                , path
                    [ SvgAttr.d "M8 8m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z"
                    ]
                    []
                , path
                    [ SvgAttr.d "M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"
                    ]
                    []
                ]
            ]
        ]


promptMessage : String -> Html msg
promptMessage msg =
    div
        [ Attr.class "mb-4 flex rounded-xl bg-slate-50 px-2 py-6 dark:bg-slate-900 sm:px-4"
        ]
        [ img
            [ Attr.class "mr-2 flex h-8 w-8 rounded-full sm:mr-4"
            , Attr.src "https://dummyimage.com/256x256/354ea1/ffffff&text=G"
            ]
            []
        , div
            [ Attr.class "flex max-w-3xl items-center rounded-xl"
            ]
            [ formatMessage msg

            --p []
            --    [ text "Certainly! Quantum computing is a new type of computing that relies on the principles of quantum physics. Traditional computers, like the one you might be using right now, use bits to store and process information. These bits can represent either a 0 or a 1. In contrast, quantum computers use quantum bits, or qubits."
            --    , br []
            --        []
            --    , br []
            --        []
            --    , text "Unlike bits, qubits can represent not only a 0 or a 1 but also a superposition of both states simultaneously. This means that a qubit can be in multiple states at once, which allows quantum computers to perform certain calculations much faster and more efficiently"
            --    ]
            ]
        ]


formatMessage : String -> Html msg
formatMessage msg =
    -- split message by \n that is replaced by <br>, output text <text> and <br> tags
    let
        parts =
            String.split "\n" msg

        formattedParts =
            List.concatMap
                (\part ->
                    if String.isEmpty part then
                        [ br [] [] ]

                    else
                        [ text part, br [] [] ]
                )
                parts
    in
    p [] formattedParts


promptContainer : Html msg
promptContainer =
    {- Prompt Messages Container - Modify the height according to your need -}
    -- TODO Add some padding all around the container
    div
        [ Attr.class "flex h-[97vh] w-full flex-col"
        ]
        [ {- Prompt Messages -}
          div
            [ Attr.class "flex-1 overflow-y-auto rounded-xl bg-slate-200 p-4 text-sm leading-6 text-slate-900 dark:bg-slate-800 dark:text-slate-300 sm:text-base sm:leading-7"
            ]
            [ promptMessageSystem "Explain quantum computing in simple terms"
            , msgActionButtons
            , promptMessage """Certainly! Quantum computing is a new type of computing that relies on the principles of quantum physics. Traditional computers, like the one you might be using right now, use bits to store and process information. These bits can represent either a 0 or a 1. In contrast, quantum computers use quantum bits, or qubits.

            Unlike bits, qubits can represent not only a 0 or a 1 but also a superposition of both states simultaneously. This means that a qubit can be in multiple states at once, which allows quantum computers to perform certain calculations much faster and more efficiently
            """
            , promptMessageSystem "What are three great applications of quantum computing?"
            , msgActionButtons
            , promptMessage """"Three great applications of quantum computing are: Optimization of complex problems, Drug Discovery and Cryptography.
            """
            , promptMessage """1
            2
            3
            4
            5
            """
            , promptMessage """1
            2
            3
            4
            5
            """
            , promptMessage """1
            2
            3
            4
            5
            """
            ]
        , promptSuggestions
        , promptMessageInput
        ]


promptButton : String -> Html msg
promptButton label =
    button
        [ Attr.class "rounded-lg bg-slate-200 p-2 hover:bg-blue-600 hover:text-slate-200 dark:bg-slate-800 dark:hover:bg-blue-600 dark:hover:text-slate-50"
        ]
        [ text label ]


promptSuggestions : Html msg
promptSuggestions =
    div
        [ Attr.class "mt-4 flex w-full gap-x-2 overflow-x-auto whitespace-nowrap text-xs text-slate-600 dark:text-slate-300 sm:text-sm"
        ]
        [ promptButton "Regenerate response"
        , promptButton "Use prompt suggestions"
        , promptButton "Toggle web search"
        , promptButton "Select a tone"
        , promptButton "Improve"
        , promptButton "Make longer"
        , promptButton "Explain in simple words"
        , promptButton "Summarize in three lines"
        , promptButton "Translate content"
        ]


promptMessageInput : Html msg
promptMessageInput =
    Html.form
        [ Attr.class "mt-2"
        ]
        [ label
            [ Attr.for "chat-input"
            , Attr.class "sr-only"
            ]
            [ text "Enter your prompt" ]
        , div
            [ Attr.class "relative"
            ]
            [ button
                [ Attr.type_ "button"
                , Attr.class "absolute inset-y-0 left-0 flex items-center pl-3 text-slate-500 hover:text-blue-600 dark:text-slate-400 dark:hover:text-blue-600"
                ]
                [ svg
                    [ Attr.attribute "aria-hidden" "true"
                    , SvgAttr.class "h-5 w-5"
                    , SvgAttr.viewBox "0 0 24 24"
                    , SvgAttr.strokeWidth "2"
                    , SvgAttr.stroke "currentColor"
                    , SvgAttr.fill "none"
                    , SvgAttr.strokeLinecap "round"
                    , SvgAttr.strokeLinejoin "round"
                    ]
                    [ path
                        [ SvgAttr.stroke "none"
                        , SvgAttr.d "M0 0h24v24H0z"
                        , SvgAttr.fill "none"
                        ]
                        []
                    , path
                        [ SvgAttr.d "M9 2m0 3a3 3 0 0 1 3 -3h0a3 3 0 0 1 3 3v5a3 3 0 0 1 -3 3h0a3 3 0 0 1 -3 -3z"
                        ]
                        []
                    , path
                        [ SvgAttr.d "M5 10a7 7 0 0 0 14 0"
                        ]
                        []
                    , path
                        [ SvgAttr.d "M8 21l8 0"
                        ]
                        []
                    , path
                        [ SvgAttr.d "M12 17l0 4"
                        ]
                        []
                    ]
                , span
                    [ Attr.class "sr-only"
                    ]
                    [ text "Use voice input" ]
                ]
            , textarea
                [ Attr.id "chat-input"
                , Attr.class "block w-full resize-none rounded-xl border-none bg-slate-200 p-4 pl-10 pr-20 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-500 dark:bg-slate-800 dark:text-slate-200 dark:placeholder-slate-400 dark:focus:ring-blue-500 sm:text-base"
                , Attr.placeholder "Enter your prompt"
                , Attr.rows 1
                , Attr.required True
                ]
                []
            , button
                [ Attr.type_ "submit"
                , Attr.class "absolute bottom-2 right-2.5 rounded-lg bg-blue-700 px-4 py-2 text-sm font-medium text-slate-200 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 sm:text-base"
                ]
                [ text "Send"
                , span
                    [ Attr.class "sr-only"
                    ]
                    [ text "Send message" ]
                ]
            ]
        ]
