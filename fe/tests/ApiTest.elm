module ApiTest exposing (suite)

import Api exposing (Conversation, ConversationPage, conversationDecoder, conversationPageDecoder)
import Expect
import Json.Decode as Decode
import Test exposing (..)
import Time exposing (Posix)


suite : Test
suite =
    describe "JSON Decoding Tests"
        [ test "Decode Conversation" <|
            \() ->
                let
                    json =
                        """
                        {
                          "id": 1,
                          "external_user_id": 2,
                          "name": "",
                          "created_at": 2,
                          "updated_at": 3
                        }
                        """

                    expectedConversation =
                        Conversation "1" "2" "" (Time.millisToPosix 2) (Time.millisToPosix 3)
                in
                Expect.equal (Decode.decodeString conversationDecoder json) (Ok expectedConversation)
        , test "Decode Conversation Page" <|
            \() ->
                let
                    json =
                        """{ "data" : [
                                {
                                  "id": 1,
                                  "external_user_id": 2,
                                  "name": "",
                                  "created_at": 2,
                                  "updated_at": 3
                                }
                             ],
                             "meta": {
                                "limit": 25,
                                "prev_id": 2,
                                "next_id": 3
                                }
                            }"""

                    expectedConversationPage =
                        ConversationPage [ Conversation "1" "2" "" (Time.millisToPosix 2) (Time.millisToPosix 3) ] "3"
                in
                Expect.equal (Decode.decodeString conversationPageDecoder json) (Ok expectedConversationPage)
        ]
