import '../models/model.dart';
import '../models/rtc_remote_update.dart';
import '../ws/model/api_server_update.dart';
import 'model/models.dart';

export 'model/models.dart';

abstract class Cache {
  List<User> get users;
  User get me;
  List<Conversation> get conversations;
  List<Message> getConversationMessages(int conversationId);
  ListState<Message> getConversationMessagesState(int conversationId);

  User? getUser(int userId);
  Conversation? getConversation(int conversationId);

  //
  void init(RTCRemoteUpdate remoteUpdate, int userId);
  Update? serverDidUpdate(APIServerUpdate message);
  Update? conversationMessagesLoaded(
      int conversationId, List<Message> newMessages, bool moreBeforeStart);
  void reset();
}
