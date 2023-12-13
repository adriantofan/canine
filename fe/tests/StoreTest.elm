module StoreTest exposing (suite)

import Api exposing (..)
import Expect
import RemoteData as WebData
import Store exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Store"
        [ test "initial state" <|
            \() ->
                Expect.equal Store.init
                    { lastConversationPage = WebData.NotAsked, conversations = [], lastConversationId = Nothing }
        , test "load more" <|
            \() ->
                let
                    initialStore =
                        Store.init

                    prevConversationPageAction =
                        Store.prevConversationPage initialStore

                    ( storePrevConversationPageRequested, _ ) =
                        Store.update Store.OnPrevConversationPage Store.init

                    ( actionSent, _ ) =
                        Store.runAction prevConversationPageAction storePrevConversationPageRequested

                    conversationPage1 =
                        ConversationPage [ Conversation "1" "2" ] "2"

                    ( storePrevConversationPageReceived, _ ) =
                        Store.update
                            (OnPrevConversationsRetrieved Nothing conversationPage1)
                            actionSent

                    prevConversationPageAction1 =
                        Store.prevConversationPage storePrevConversationPageReceived

                    ( storePrevConversationPageRequested1, _ ) =
                        Store.update Store.OnPrevConversationPage storePrevConversationPageReceived

                    prevConversationPageAction2 =
                        Store.prevConversationPage storePrevConversationPageRequested1
                in
                expectAll
                    [ Expect.equal { lastConversationPage = WebData.NotAsked, conversations = [], lastConversationId = Nothing } initialStore
                    , Expect.equal (PrevConversationPage Nothing) prevConversationPageAction
                    , Expect.equal { lastConversationPage = WebData.NotAsked, conversations = [], lastConversationId = Nothing } storePrevConversationPageRequested
                    , Expect.equal { lastConversationPage = WebData.Loading, conversations = [], lastConversationId = Nothing } actionSent
                    , Expect.equal { lastConversationPage = WebData.Success conversationPage1, conversations = [ Conversation "1" "2" ], lastConversationId = Just "2" } storePrevConversationPageReceived
                    , Expect.equal (PrevConversationPage (Just "2")) prevConversationPageAction1
                    , Expect.equal prevConversationPageAction2 prevConversationPageAction1
                    ]
        ]


expectAll : List Expect.Expectation -> Expect.Expectation
expectAll expectations =
    Expect.all (List.map always expectations) ()
