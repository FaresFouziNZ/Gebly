import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/providers/cart_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ItemCardViewModel {
  // ItemCardViewModel();
  void addItem(WidgetRef ref, Item item) {
    ref.read(cartProvider).update(item, (value) => value + 1, ifAbsent: () => 1);
  }

  void incrementItem(WidgetRef ref, Item item) {
    ref.read(cartProvider).update(item, (value) => value + 1, ifAbsent: () => 1);
  }

  void decrementItem(WidgetRef ref, Item item) {
    if (ref.read(cartProvider)[item] == 0) {
      return;
    }

    ref.read(cartProvider).update(item, (value) => value - 1);
  }

  // void deleteItem(WidgetRef ref, Item item) {
  //   ref.read(cartProvider).remove(item);
  // }
  bool isItemInCart(WidgetRef ref, Item item) {
    return ref.watch(cartProvider).containsKey(item);
  }

  String getItemCount(WidgetRef ref, Item item) {
    return ref.watch(cartProvider)[item].toString();
  }

  String getTotalPrice(WidgetRef ref, Item item) {
    return (toInt(ref.watch(cartProvider)[item])! * item.price).toString();
  }
}
