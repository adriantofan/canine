import 'package:canine_sync/models/timestamp_serializer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deserialize go produced / js timestamp', () {
    // 2024-01-29 10:44:10.480000
    int ts = 1706521450480;
    TimestampSerializer serializer = const TimestampSerializer();
    DateTime actual = serializer.fromJson(ts);
    DateTime expected = DateTime(2024, 1, 29, 10, 44, 10, 480);
    expect(actual, expected);
  });

  test('serialize to milliseconds and truncate micro', () {
    TimestampSerializer serializer = const TimestampSerializer();
    int ts = serializer.toJson(DateTime(2024, 1, 29, 10, 44, 10, 480, 999));
    expect(ts, 1706521450480);
  });
}
