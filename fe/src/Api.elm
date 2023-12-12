module Api exposing (..)

import Http
import Json.Decode exposing (Decoder, field, int, list, map2, string)


type alias ConversationId =
    Int


type alias Conversation =
    { id : Int
    , name : String
    }


type alias ConversationPage =
    { data : List Conversation
    , next : ConversationId
    }


conversationDecoder : Decoder Conversation
conversationDecoder =
    map2 Conversation
        (field "id" int)
        (field "name" string)


conversationPageDecoder : Decoder ConversationPage
conversationPageDecoder =
    map2 ConversationPage
        (field "conversations" (list conversationDecoder))
        (field "next" int)


getConversationPage : Maybe ConversationId -> (Result Http.Error ConversationPage -> msg) -> Cmd msg
getConversationPage maybeId toMsg =
    let
        idStr =
            case maybeId of
                Nothing ->
                    ""

                Just id ->
                    "?last=" ++ String.fromInt id
    in
    Http.get
        { url = "http://localhost:1234/api/tmp-conversations" ++ idStr
        , expect = Http.expectJson toMsg conversationPageDecoder
        }
