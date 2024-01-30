import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_serializer.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required int id,
    required int conversationId,
    required int senderId,
    required String message,
    required String type,
    @TimestampSerializer()
    required DateTime createdAt, // TODO: use DateTime, requires converter
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
