import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/models/restaurant.dart';
import 'package:gebly/core/providers/cart_provider.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventMadeViewModel {
  Future<Restaurant> getRestaurant({required int id}) async {
    return await DatabaseServices().getRestaurantByID(restaurantID: id);
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
