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
  Update? doUpdate(APIServerMessage message);

  Stream<HistoryState> conversationHistoryStream<HistoryState>(
      int conversationId);
  HistoryState conversationHistory(int conversationId);
  updateConversationHistory(
      int conversationId, RemoteDataStatus startStatus, final int? startId);

  void reset();
  void init(RTCRemoteUpdate remoteUpdate);
}
