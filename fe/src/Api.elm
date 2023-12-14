module Api exposing (..)

import Http
import Json.Decode exposing (Decoder, field, float, int, list, map2, map5, string)
import Time exposing (Posix)



-- CONVERSATIONS


type alias ConversationId =
    String


type alias UserId =
    String


type alias Conversation =
    { id : ConversationId
    , user1Id : UserId
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



-- Define a custom decoder for the date-time field produced by Go.
-- MESSAGES


type alias MessageId =
    String


type alias Message =
    { id : MessageId
    , conversationId : ConversationId
    , sender_id : UserId
    , text : String
    , created_at : Time.Posix
    }



-- status: Internal | Queued | Sent | Delivered | Read
-- type SystemMsg | UserMsg | TeamMsg


type alias MessagePage =
    { data : List Message
    , next : MessageId
    }


messageDecoder : Decoder Message
messageDecoder =
    map5 Message
        (field "id" stringFromInt)
        (field "conversation_id" stringFromInt)
        (field "sender_id" stringFromInt)
        (field "message" string)
        (field "created_at" posixFromInt)


messagePageDecoder : Decoder MessagePage
messagePageDecoder =
    map2 MessagePage
        (field "data" (list messageDecoder))
        (field "meta" (field "next_id" stringFromInt))


getMessagePage : ConversationId -> Maybe MessageId -> (Result Http.Error MessagePage -> msg) -> Cmd msg
getMessagePage conversationId maybeId toMsg =
    let
        idStr =
            case maybeId of
                Nothing ->
                    "?limit=5"

                Just id ->
                    "?limit=5&lower_than=" ++ id
    in
    Http.get
        { url = "http://localhost:1234/api/users/1/conversations/" ++ conversationId ++ "/messages" ++ idStr
        , expect = Http.expectJson toMsg messagePageDecoder
        }


posixFromInt : Decoder Time.Posix
posixFromInt =
    int |> Json.Decode.map Time.millisToPosix
