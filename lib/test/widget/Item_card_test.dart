import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gebly/presentation/widget/item_card.dart';

import '../../core/models/item.dart';

void main() {
  testWidgets('ItemCard displays title and description',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ItemCard(
        item: Item(
          id: 1,
          name: 'Test Item',
          price: 10.0,
          photoUrl: 'https://via.placeholder.com/150',
          restaurantID: 1,
          createdAt: DateTime.now(),
        ),
        onTap: () {},
      ),
    ));

    expect(find.text('Test Item'), findsOneWidget);
    expect(find.text('This is a test description'), findsOneWidget);
  });
}
