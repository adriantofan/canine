module Conversations exposing (Config, dataRequests, view)

import Api
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (onClick)
import RemoteData
import Store


type alias Config msg =
    { loadPrevMsg : msg
    }


view : Config msg -> Store.Store -> Html msg
view config store =
    let
        conversations =
            [ Api.Conversation 1 "name 1", Api.Conversation 2 "name 2" ]
    in
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
            ([ conversationLoadingCell config store ] ++ List.map (conversationCell False) conversations)

        --[ Html.form []
        --    [ label
        --        [ Attr.for "chat-input"
        --        , Attr.class "sr-only"
        --        ]
        --        [ text "Search chats" ]
        --    , div
        --        [ Attr.class "relative"
        --        ]
        --        [ input
        --            [ Attr.id "search-chats"
        --            , Attr.type_ "text"
        --            , Attr.class "w-full rounded-lg border border-slate-300 bg-slate-50 p-3 pr-10 text-sm text-slate-800 focus:outline-none focus:ring-2 focus:ring-blue-500 dark:border-slate-700 dark:bg-slate-900 dark:text-slate-200"
        --            , Attr.placeholder "Search chats"
        --            , Attr.rows 1
        --            , Attr.required True
        --            ]
        --            []
        --        , button
        --            [ Attr.type_ "submit"
        --            , Attr.class "absolute bottom-2 right-2.5 rounded-lg p-2 text-sm text-slate-500 hover:text-blue-700 focus:outline-none sm:text-base"
        --            ]
        --            [ Assets.searchSvg
        --            , span
        --                [ Attr.class "sr-only"
        --                ]
        --                [ text "Search chats" ]
        --            ]
        --        ]
        --    ]
        ]


conversationLoadingCell : Config msg -> Store.Store -> Html msg
conversationLoadingCell config s =
    let
        loading =
            s.lastConversationPage == RemoteData.Loading

        buttonLabel =
            if loading then
                "Loading..."

            else
                "Load more..."

        loadHeader =
            [ h1
                [ Attr.class "text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
                ]
                [ text buttonLabel ]
            ]

        hasLoadErrorConversation =
            case s.lastConversationPage of
                RemoteData.Failure _ ->
                    True

                _ ->
                    False

        infoText =
            if hasLoadErrorConversation then
                [ p [ Attr.class "text-xs text-slate-500 dark:text-slate-400" ]
                    [ text "Failed to load" ]
                ]

            else
                []

        onClickEvent =
            if loading then
                []

            else
                [ onClick config.loadPrevMsg ]

        buttonAttributes =
            [ Attr.class
                "flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 focus:outline-none hover:bg-slate-200 dark:hover:bg-slate-800"
            ]
    in
    button
        (buttonAttributes ++ onClickEvent)
        (loadHeader ++ infoText)


conversationCell : Bool -> Api.Conversation -> Html msg
conversationCell selected c =
    button
        [ Attr.class
            ("flex w-full flex-col gap-y-2 rounded-lg px-3 py-2 text-left transition-colors duration-200 focus:outline-none hover:bg-slate-200"
                ++ (if selected then
                        " bg-slate-200 dark:bg-slate-800"

                    else
                        " dark:hover:bg-slate-800"
                   )
            )
        ]
        [ h1
            [ Attr.class "text-sm font-medium capitalize text-slate-700 dark:text-slate-200"
            ]
            [ text c.name ]
        , p
            [ Attr.class "text-xs text-slate-500 dark:text-slate-400"
            ]
            [ text "fake date" ]
        ]


dataRequests : Store.Store -> List Store.Action
dataRequests store =
    [ Store.prevConversationPage store ]
