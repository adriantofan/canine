module Conversation exposing (..)

import Json.Decode exposing (Decoder, bool, field, int, list, map2, map5, string)


type alias Conversation =
    { id : Int
    , name : String
    }


type alias Message =
    { id : Int
    , text : String
    , author : String
    , timestamp : String
    , visible : Bool
    }


dummyMessage =
    Message 0 "Content of the message" "Author" "timestamp" True


messageDecoder : Decoder Message
messageDecoder =
    map5 Message
        (field "id" int)
        (field "text" string)
        (field "author" string)
        (field "timestamp" string)
        (field "visible" bool)


conversationDecoder : Decoder Conversation
conversationDecoder =
    map2 Conversation
        (field "id" int)
        (field "name" string)


getConversationsDecoder : Decoder (List Conversation)
getConversationsDecoder =
    list conversationDecoder
