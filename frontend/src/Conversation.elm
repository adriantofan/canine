module Conversation exposing (..)


type alias Conversation =
    { id : Int
    , name : String
    , messages : List Message
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
