import '../models/model.dart';

const conversationCount = 20;
final List<Conversation> fakeConversationList = [
  for (var i = 1; i <= conversationCount; i++)
    Conversation(
        id: i,
        externalUserId: i,
        name: "Conversation $i",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
];

final Map<int, Conversation> fakeConversationMap = {
  for (var conversation in fakeConversationList) conversation.id: conversation
};

final now = DateTime.now();
const loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
final everyMinuteTimestampList =
    List.generate(10, (index) => (now..add(Duration(minutes: -index))));
final ids = [for (var i = 1; i <= conversationCount; i++) i];

final Map<int, List<Message>> fakeMessages = {
  for (var conversationID in ids)
    conversationID: List.generate(
      5,
      (index) {
        final messageID = conversationID * 10000 + index;
        final msgCount = index + 1;
        return Message(
            id: messageID,
            conversationId: conversationID,
            senderId:
                conversationID, // each conversation has one sender with id equal to conversation id
            message: "$messageID $msgCount $loremIpsum",
            type: "n/a",
            createdAt: everyMinuteTimestampList[index]);
      },
    )
};

final Map<int, User> fakeUsers = {
  for (var userID in ids)
    userID: User(
        id: userID,
        messagingAddress: 'user $userID',
        workspaceId: 0,
        type: UserType.external,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
};
