module Api exposing (..)

import Http
import Json.Decode exposing (Decoder, field, int, list, map, map2, string)


type alias ConversationId =
    String


type alias Conversation =
    { id : ConversationId
    , user1Id : String
    }


type alias ConversationPage =
    { data : List Conversation
    , next : ConversationId
    }


conversationDecoder : Decoder Conversation
conversationDecoder =
    map2 Conversation
        (field "id" stringFromInt)
        (field "user1_id" stringFromInt)


conversationPageDecoder : Decoder ConversationPage
conversationPageDecoder =
    map2 ConversationPage
        (field "data" (list conversationDecoder))
        (field "meta" (field "next_id" stringFromInt))


stringFromInt : Decoder String
stringFromInt =
    int |> Json.Decode.map String.fromInt



--(field "next" int)


getConversationPage : Maybe ConversationId -> (Result Http.Error ConversationPage -> msg) -> Cmd msg
getConversationPage maybeId toMsg =
    let
        idStr =
            case maybeId of
                Nothing ->
                    ""

                Just id ->
                    "?lower_than=" ++ id
    in
    Http.get
        { url = "http://localhost:1234/api/users/1/conversations" ++ idStr
        , expect = Http.expectJson toMsg conversationPageDecoder
        }
