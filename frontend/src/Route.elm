module Route exposing (..)

import Url exposing (Url)
import Url.Parser exposing ((</>), Parser, int, map, oneOf, parse, s, string, top)


type Route
    = Home
    | Conversations (Maybe Int)


conversationWithId id =
    Conversations (Just id)


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map (Conversations Nothing) (s "conversations")
        , map conversationWithId (s "conversation" </> Url.Parser.int)
        ]


toRoute : Url -> Route
toRoute url =
    Maybe.withDefault Home (parse routeParser url)


isConversation : Route -> Bool
isConversation route =
    case route of
        Conversations _ ->
            True

        _ ->
            False
