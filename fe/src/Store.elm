module Store exposing (Action(..), Msg(..), Store, init, prevConversationPage, runAction, update)

import Api exposing (Conversation, ConversationId, ConversationPage, getConversationPage)
import Paginated


type alias Store =
    { conversations : Paginated.Model Conversation ConversationId
    }


type Action
    = ConversationAction (Paginated.Action ConversationId)


type Msg
    = ConversationMsg (Paginated.Msg ConversationId ConversationPage)


init : Store
init =
    { conversations = Paginated.init
    }


prevConversationPage : Store -> Action
prevConversationPage store =
    ConversationAction (Paginated.PrevPage <| prevConversationPageId store)


conversationsConfig : Paginated.Config Conversation ConversationId ConversationPage
conversationsConfig =
    { fetchPrev = getConversationPage
    , data = .data
    , nextId = .next
    }


runAction : Action -> Store -> ( Store, Cmd Msg )
runAction action store =
    case action of
        ConversationAction conversationAction ->
            let
                ( conversation, cmd ) =
                    Paginated.runAction conversationsConfig conversationAction store.conversations
            in
            ( { store | conversations = conversation }, Cmd.map ConversationMsg cmd )


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        ConversationMsg conversationMsg ->
            let
                ( conversation, cmd ) =
                    Paginated.update conversationsConfig conversationMsg store.conversations
            in
            ( { store | conversations = conversation }, Cmd.map ConversationMsg cmd )


prevConversationPageId : Store -> Maybe ConversationId
prevConversationPageId store =
    store.conversations.nextIdToLoad
