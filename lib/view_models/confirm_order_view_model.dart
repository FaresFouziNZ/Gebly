import 'dart:math';

import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/models/order.dart';
import 'package:gebly/core/providers/cart_provider.dart';
import 'package:gebly/core/providers/event_provider.dart';
import 'package:gebly/core/services/authentication_services.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmOrderViewModel {
  List<Item> getCartItems(WidgetRef ref) {
    List<Item> items = [];
    ref.watch(cartProvider).forEach((key, value) {
      if (value > 0) {
        items.add(key);
      }
    });
    return items;
  }

  double getTotalPrice(WidgetRef ref) {
    double total = 0;
    ref.watch(cartProvider).forEach((key, value) {
      if (value > 0) {
        total += key.price * value;
      }
    });
    return total;
  }

  Future<Order> confirmOrder(WidgetRef ref) async {
    // final items = getCartItems(ref);
    final items = ref.watch(cartProvider);
    if (ref.read(eventProvider).id == 0) {
      final total = getTotalPrice(ref);
      final eventID = await DatabaseServices().latestEventID();
      final newEvent = Event(
        bossID: AuthenticationServices().currentUser!.id,
        id: eventID + 1,
        restaurantID: ref.watch(cartProvider).keys.first.restaurantID,
        status: 'Open',
        isShare: false,
        totalPrice: total,
        createdAt: DateTime.now(),
        code: codeGenerator(),
      );
      final event = await DatabaseServices().createEvent(event: newEvent);
      ref.read(eventProvider.notifier).state = event;
      final orderID = await DatabaseServices().latestOrderID();
      final order = Order(
        userID: AuthenticationServices().currentUser!.id,
        eventID: event.id!,
        orderTotal: total,
        orderID: orderID + 1,
        createdAt: DateTime.now(),
      );
      return await DatabaseServices().makeOrder(order: order, items: items);
    } else {
      final event = ref.read(eventProvider);
      final total = getTotalPrice(ref);
      final orderID = await DatabaseServices().latestOrderID();
      final order = Order(
        userID: AuthenticationServices().currentUser!.id,
        eventID: event.id!,
        orderTotal: total,
        orderID: orderID + 1,
        createdAt: DateTime.now(),
      );
      return await DatabaseServices().makeOrder(order: order, items: items);
    }
  }

  String codeGenerator() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    String code = '';
    for (int i = 0; i < 6; i++) {
      code += characters[random.nextInt(characters.length)];
    }
    return code;
  }
}
