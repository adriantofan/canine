module Messages exposing (..)

import Api
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (onClick)
import RemoteData
import Store
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr


type alias Config msg =
    { loadPrevMsg : msg
    , conversationID : Api.ConversationId
    }


view : Config msg -> Store.Store -> Html msg
view config store =
    {- Prompt Messages Container - Modify the height according to your need -}
    -- TODO Add some padding all around the container
    div
        [ Attr.class "flex h-[97vh] w-full flex-col"
        ]
        [ {- Prompt Messages -}
          div
            [ Attr.class "flex-1 overflow-y-auto rounded-xl bg-slate-200 p-4 text-sm leading-6 text-slate-900 dark:bg-slate-800 dark:text-slate-300 sm:text-base sm:leading-7"
            ]
            ([ loadMoreButton config ]
                ++ promptMessages config store
            )
        , promptSuggestions
        , promptMessageInput
        ]


loadMoreButton : Config msg -> Html msg
loadMoreButton config =
    div
        [ Attr.class "flex justify-center"
        , onClick config.loadPrevMsg
        ]
        [ div
            [ Attr.class "mb-4 py-1 sm:px-4 mx-auto"
            ]
            [ button
                [ Attr.type_ "submit"
                , Attr.class "inline-flex items-center gap-x-2 rounded-lg bg-slate-700 px-3 py-2 text-center text-sm font-medium text-slate-50 hover:bg-blue-600 focus:outline-none focus:ring focus:ring-blue-300"
                ]
                [ text "Submit" ]
            ]
        ]


promptMessages : Config msg -> Store.Store -> List (Html msg)
promptMessages config store =
    let
        messages =
            Store.getMessages store

        messageCell : Api.Message -> List (Html msg)
        messageCell message =
            [ promptMessage <| message.text ]
    in
    List.concatMap messageCell messages


msgs =
    [ promptMessageSystem "Explain quantum computing in simple terms"
    , msgActionButtons
    , promptMessage """Certainly! Quantum computing is a new type of computing that relies on the principles of quantum physics. Traditional computers, like the one you might be using right now, use bits to store and process information. These bits can represent either a 0 or a 1. In contrast, quantum computers use quantum bits, or qubits.
                 
                             Unlike bits, qubits can represent not only a 0 or a 1 but also a superposition of both states simultaneously. This means that a qubit can be in multiple states at once, which allows quantum computers to perform certain calculations much faster and more efficiently
                             """
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
