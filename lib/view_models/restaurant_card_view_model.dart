import 'package:flutter/material.dart';
import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/providers/cart_provider.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RestaurantCardViewModel {
  String getOpenHours(String openHours) {
    return 'until 10:00 PM';
  }

  void loadMenu({required int restaurantId, required WidgetRef ref}) async {
    final data = await DatabaseServices().getMenu(restaurantID: restaurantId);
    Map<Item, int> cart = {};
    for (var item in data) {
      cart[item] = 0;
    }
    ref.read(cartProvider.notifier).state.clear();
    ref.read(cartProvider.notifier).state = cart;
  }
}

Widget getRestaurantStatus(String openHours) {
  // final timeNow = DateTime.now();

  return Row(
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: ShapeDecoration(
          color: const Color(0xFF7CFF89),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
        child: Text('open'),
      )
    ],
  );
}
