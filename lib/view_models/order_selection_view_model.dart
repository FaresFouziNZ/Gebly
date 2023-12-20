import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/providers/cart_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderSelectionViewModel {
  String getCartItemCount(WidgetRef ref) {
    int count = 0;
    ref.watch(cartProvider).forEach((key, value) {
      count += value;
    });
    return count.toString();
  }

  bool ableToProceed(WidgetRef ref) {
    final count = getCartItemCount(ref);
    if (count == '0') {
      return false;
    }
    return true;
  }

  void getMenu(List<Item> data, WidgetRef ref) async {
    Map<Item, int> cart = {};
    for (var item in data) {
      cart[item] = 0;
    }
    ref.read(cartProvider.notifier).state = cart;
  }
}
