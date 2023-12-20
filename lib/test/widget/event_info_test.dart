import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gebly/presentation/widget/event_info.dart';
import 'package:gebly/core/models/event.dart';

void main() {
  testWidgets('EventInfo displays event details', (WidgetTester tester) async {
    final event = Event(
      id: 1,
      bossID: '1',
      restaurantID: 1,
      createdAt: DateTime.now(),
      deadline: DateTime.now(),
      status: 'active',
      isShare: false,
      totalPrice: 10.0,
      code: '123456',
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: EventInfo(),
      ),
    ));

    expect(find.text('Sample Event'), findsOneWidget);
    expect(find.text('This is a test event.'), findsOneWidget);
  });
}
