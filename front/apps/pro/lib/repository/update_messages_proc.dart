import 'package:app/messages/messages.dart';
import 'package:app/messages/model/chat_message.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:logging/logging.dart';

class UpdateMessagesProcRef implements ProcBuilder<List<ChatMessage>> {
  final int _conversationId;

  const UpdateMessagesProcRef(this._conversationId);

  @override
  Proc<List<ChatMessage>> build() {
    return UpdateMessagesProc(_conversationId);
  }
}

class UpdateMessagesProc implements Proc<List<ChatMessage>> {
  final _log = Logger('UpdateMessagesProc');
  final int _conversationId;

  UpdateMessagesProc(this._conversationId);
  List<ChatMessage>? _prev;

  @override
  List<ChatMessage>? init(Cache cache) {
    return _prev = bootstrap(cache);
  }

  @override
  List<ChatMessage>? update(Update changes, Cache cache) {
    if (_prev == null) {
      return _prev = bootstrap(cache);
    }
    switch (changes) {
      case UpdateMessagesAdded():
        return _prev = _handleUpdateMessagesAdded(_prev!, changes, cache);
      case UpdateServer():
        return _prev = _handelUpdateServer(_prev!, changes, cache);
    }
  }

  List<ChatMessage> _handelUpdateServer(
      List<ChatMessage> prev, UpdateServer changes, Cache cache) {
    final message = changes.message;
    switch (message) {
      case APIServerUpdateInvalid():
      case APIServerUpdateUsers():
      case APIServerUpdateConversation():
        _log.warning(
            "UpdateMessagesProc._handelUpdateServer: 🟡UNIMPLEMENTED $message");
        return prev;
      case APIServerUpdateMessage():
        if (message.data.conversationId != _conversationId) {
          return prev;
        }
        switch (message.kind) {
          case APIServerUpdateKind.create:
            final newConversationItems = [message.data]
                .map((c) => makeChatMessage(c, cache))
                .nonNulls
                .toList();
            return newConversationItems + prev;
          case APIServerUpdateKind.update:
          case APIServerUpdateKind.delete:
            _log.warning(
                "UpdateMessagesProc._handelUpdateServer: Server not supposed to send $message");
            return prev;
        }
    }
  }

  List<ChatMessage> _handleUpdateMessagesAdded(
      List<ChatMessage> prev, UpdateMessagesAdded changes, Cache cache) {
    if (changes.conversationId != _conversationId) {
      return prev;
    }

    final newConversationItems = changes.newMessages
        .map((c) => makeChatMessage(c, cache))
        .nonNulls
        .toList();
    return prev + newConversationItems;
  }

  List<ChatMessage> bootstrap(Cache cache) {
    final messages = cache.getConversationMessages(_conversationId);
    final conversationItems =
        messages.map((c) => makeChatMessage(c, cache)).nonNulls.toList();
    return conversationItems;
  }
}

ChatMessage? makeChatMessage(Message message, Cache cache) {
  // TODO: can have conversation without messages ? at sync start, depends on implementation
  final user = cache.getUser(message.senderId)!;

  return ChatMessage(
      id: message.id,
      name: user.messagingAddress,
      type: message.type,
      message: message.message,
      time: message.createdAt,
      userId: user.id,
      attachments: message.attachments);
}
