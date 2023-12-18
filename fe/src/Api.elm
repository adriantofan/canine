module Api exposing (..)

import Http
import Json.Decode exposing (Decoder, field, float, int, list, map2, map5, map6, string)
import Time exposing (Posix)



-- CONVERSATIONS


type alias ConversationId =
    String


type alias UserId =
    String


type alias Conversation =
    { id : ConversationId
    , externalUserId : UserId
    , name : String
    , createdAt : Time.Posix
    , updatedAt : Time.Posix
    }


type alias ConversationPage =
    { data : List Conversation
    , next : ConversationId
    }


conversationDecoder : Decoder Conversation
conversationDecoder =
    map5 Conversation
        (field "id" stringFromInt)
        (field "external_user_id" stringFromInt)
        (field "name" string)
        (field "created_at" posixFromInt)
        (field "updated_at" posixFromInt)


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
                    "?limit=5&lower_than=" ++ id
    in
    Http.get
        { url = "http://localhost:1234/api/conversations" ++ idStr
        , expect = Http.expectJson toMsg conversationPageDecoder
        }



-- Define a custom decoder for the date-time field produced by Go.
-- MESSAGES


type alias MessageId =
    String


type MessageType
    = MessageTypeAsk
    | MessageTypeMsg


type alias Message =
    { id : MessageId
    , conversationId : ConversationId
    , sender_id : UserId
    , msgType : MessageType
    , message : String
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
    map6 Message
        (field "id" stringFromInt)
        (field "conversation_id" stringFromInt)
        (field "sender_id" stringFromInt)
        (field "type" messageTypeDecoder)
        (field "message" string)
        (field "created_at" posixFromInt)


messageTypeDecoder : Decoder MessageType
messageTypeDecoder =
    string
        |> Json.Decode.andThen
            (\str ->
                case str of
                    "ask" ->
                        Json.Decode.succeed MessageTypeAsk

                    "msg" ->
                        Json.Decode.succeed MessageTypeMsg

                    _ ->
                        Json.Decode.fail "Unknown message type"
            )


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
        { url = "http://localhost:1234/api/conversations/" ++ conversationId ++ "/messages" ++ idStr
        , expect = Http.expectJson toMsg messagePageDecoder
        }


posixFromInt : Decoder Time.Posix
posixFromInt =
    int |> Json.Decode.map Time.millisToPosix
