module Conversations exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes as Attr
import Http
import Json.Decode exposing (Decoder, bool, field, int, list, map2, map5, string)


type alias Model =
    { data : Maybe ConversationPage
    , state : LoadState
    }


type alias ConversationPage =
    { conversations : List Conversation
    , lastId : Int
    }


type alias Conversation =
    { id : Int
    , name : String
    }


type LoadState
    = Loading
    | Loaded
    | Error String


type Msg
    = GotConversations (Result Http.Error (List Conversation))


view : Model -> Html Msg
view model =
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

            --, Attr.style "height" "150px"
            ]
            (List.map (conversationCell False) [ Conversation 1 "name 1", Conversation 2 "name 2" ])

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


conversationCell : Bool -> Conversation -> Html msg
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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


init : Maybe Int -> ( Model, Cmd Msg )
init _ =
    ( { data = Nothing
      , state = Loading
      }
    , Cmd.none
    )



-- API


loadConversations : Maybe Int -> Cmd Msg
loadConversations lastId =
    let
        baseUrl =
            "http://localhost:3000/conversations"

        url =
            case lastId of
                Just id ->
                    baseUrl ++ "/" ++ String.fromInt id

                Nothing ->
                    baseUrl
    in
    Http.get
        { url = url
        , expect = Http.expectJson GotConversations getConversationsDecoder
        }



-- DECODERS


conversationDecoder : Decoder Conversation
conversationDecoder =
    map2 Conversation
        (field "id" int)
        (field "name" string)


getConversationsDecoder : Decoder (List Conversation)
getConversationsDecoder =
    list conversationDecoder
