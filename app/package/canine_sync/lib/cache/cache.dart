import '../models/model.dart';
import '../models/rtc_remote_update.dart';
import '../ws/model/api_server_message.dart';
import 'model/updates.dart';

export 'model/updates.dart';

abstract class Cache {
  List<Conversation> get conversations;
  List<Message> getConversationMessages(int conversationId);
  User? getUser(int userId);
  Conversation? getConversation(int conversationId);

  //
  void init(RTCRemoteUpdate remoteUpdate);
  Update? serverDidUpdate(APIServerMessage message);
  Update? conversationMessagesLoaded(
      int conversationId, List<Message> newMessages);
  void reset();
}
