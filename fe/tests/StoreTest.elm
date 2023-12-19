module StoreTest exposing (suite)

import Api exposing (..)
import Dict
import Expect
import Paginated
import RemoteData as WebData
import Store exposing (..)
import Test exposing (..)
import Time


suite : Test
suite =
    describe "Store"
        [ test "initial state" <|
            \() ->
                Expect.equal (Store.init Nothing)
                    { conversations =
                        { data = []
                        , loadingId = WebData.NotAsked
                        , nextIdToLoad = Nothing
                        }
                    , messages = Nothing
                    , ongoing = Dict.empty
                    , userId = "13"
                    }
        , test "load more" <|
            \() ->
                let
                    initialStore =
                        Store.init Nothing

                    prevConversationPageAction =
                        Store.prevConversationPage initialStore

                    ( storePrevConversationPageRequested, _ ) =
                        Store.update (Store.ConversationMsg Paginated.OnPrevPage) (Store.init Nothing)

                    ( actionSent, _ ) =
                        Store.runAction prevConversationPageAction storePrevConversationPageRequested

                    conversationPage1 =
                        ConversationPage [ Conversation "1" "2" "" (Time.millisToPosix 2) (Time.millisToPosix 3) ] "2"

                    ( storePrevConversationPageReceived, _ ) =
                        Store.update
                            (Store.ConversationMsg (Paginated.OnPrevRetrieved conversationPage1))
                            actionSent

                    prevConversationPageAction1 =
                        Store.prevConversationPage storePrevConversationPageReceived

                    ( storePrevConversationPageRequested1, _ ) =
                        Store.update (Store.ConversationMsg Paginated.OnPrevPage) storePrevConversationPageReceived

                    prevConversationPageAction2 =
                        Store.prevConversationPage storePrevConversationPageRequested1
                in
                expectAll
                    [ Expect.equal
                        { conversations =
                            { data = []
                            , loadingId = WebData.NotAsked
                            , nextIdToLoad = Nothing
                            }
                        , messages = Nothing
                        , ongoing = Dict.empty
                        , userId = "13"
                        }
                        initialStore
                    , Expect.equal (ConversationAction (Paginated.PrevPage Nothing)) prevConversationPageAction
                    , Expect.equal
                        { conversations =
                            { data = []
                            , loadingId = WebData.NotAsked
                            , nextIdToLoad = Nothing
                            }
                        , messages = Nothing
                        , ongoing = Dict.empty
                        , userId = "13"
                        }
                        storePrevConversationPageRequested
                    , Expect.equal
                        { conversations =
                            { data = []
                            , loadingId = WebData.Loading
                            , nextIdToLoad = Nothing
                            }
                        , messages = Nothing
                        , ongoing = Dict.empty
                        , userId = "13"
                        }
                        actionSent

                    --, Expect.equal { lastConversationPage = WebData.Success conversationPage1, conversations = [ Conversation "1" "2" ], lastConversationId = Just "2" } storePrevConversationPageReceived
                    , Expect.equal
                        { conversations =
                            { data = [ Conversation "1" "2" "" (Time.millisToPosix 2) (Time.millisToPosix 3) ]
                            , loadingId = WebData.Success ()
                            , nextIdToLoad = Just "2"
                            }
                        , messages = Nothing
                        , ongoing = Dict.empty
                        , userId = "13"
                        }
                        storePrevConversationPageReceived
                    , Expect.equal (ConversationAction (Paginated.PrevPage (Just "2"))) prevConversationPageAction1
                    , Expect.equal prevConversationPageAction2 prevConversationPageAction1
                    ]
        ]


expectAll : List Expect.Expectation -> Expect.Expectation
expectAll expectations =
    Expect.all (List.map always expectations) ()
