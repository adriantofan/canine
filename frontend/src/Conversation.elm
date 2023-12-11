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
