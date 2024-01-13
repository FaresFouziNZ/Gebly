import 'package:flutter_test/flutter_test.dart';
import 'package:gebly/core/models/event.dart';

void main() {
  test('Event serialization and deserialization', () {
    final eventJson = {'id': 1, 'bossID': '1', 'restaurantID': '1'};
    final event = Event.fromJson(eventJson);

    expect(event.id, 1);
    expect(event.bossID, '1');
    expect(event.restaurantID, '1');

    final serializedJson = event.toJson();
    expect(serializedJson, equals(eventJson));
  });
}
