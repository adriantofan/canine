import 'package:json_annotation/json_annotation.dart';

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp);

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}
