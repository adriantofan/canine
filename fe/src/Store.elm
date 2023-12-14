module Store exposing (Action(..), Msg(..), Store, init, prevConversationPage, runAction, update)

import Api exposing (Conversation, ConversationId, ConversationPage, getConversationPage)
import Paginated


type alias Store =
    { conversations : Paginated.Model
    }


type Action
    = ConversationAction Paginated.Action


type Msg
    = ConversationMsg Paginated.Msg


init : Store
init =
    { conversations = Paginated.init
    }


prevConversationPage : Store -> Action
prevConversationPage store =
    ConversationAction (Paginated.PrevPage <| prevConversationPageId store)


runAction : Action -> Store -> ( Store, Cmd Msg )
runAction action store =
    case action of
        ConversationAction conversationAction ->
            let
                ( conversation, cmd ) =
                    Paginated.runAction conversationAction store.conversations
            in
            ( { store | conversations = conversation }, Cmd.map ConversationMsg cmd )


update : Msg -> Store -> ( Store, Cmd Msg )
update msg store =
    case msg of
        ConversationMsg conversationMsg ->
            let
                ( conversation, cmd ) =
                    Paginated.update conversationMsg store.conversations
            in
            ( { store | conversations = conversation }, Cmd.map ConversationMsg cmd )


prevConversationPageId : Store -> Maybe ConversationId
prevConversationPageId store =
    store.conversations.nextIdToLoad
