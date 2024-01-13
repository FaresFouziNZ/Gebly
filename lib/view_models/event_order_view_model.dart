import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventOrderViewModel {
  Future<Map<Item, int>> getItems({required int eventID, required WidgetRef ref}) async {
    List<int> allItemsIDs = [];
    Map<Item, int> totalItems = {};
    final orders = await DatabaseServices().getOrders(eventID: eventID);
    for (var order in orders) {
      List<Map<dynamic, dynamic>> itemsOfTheOrder = await DatabaseServices().getOrderItems(orderID: order.orderID!);
      for (var item in itemsOfTheOrder) {
        final itemFullInfo = await DatabaseServices().getItemByID(itemID: item['item_id']);
        if (!allItemsIDs.contains(itemFullInfo.id)) {
          allItemsIDs.add(itemFullInfo.id);
          totalItems[itemFullInfo] = item['quantity'];
        } else {
          for (var i = 0; i < allItemsIDs.length; i++) {
            if (totalItems.keys.elementAt(i).id == itemFullInfo.id) {
              totalItems.update(
                totalItems.keys.elementAt(i),
                (value) => (value + item['quantity']).toInt(),
                ifAbsent: () => item['quantity'],
              );
            }
          }
        }

        // items.update(
        //   itemInfo,
        //   (value) => (value + item['quantity']).toInt(),
        //   ifAbsent: () => item['quantity'],
        // );
      }
    }
    return totalItems;
  }
}
