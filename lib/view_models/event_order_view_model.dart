import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/services/database_queries.dart';

class EventOrderViewModel {
  Future<Map<Item, int>> getItems({required int eventID}) async {
    Map<Item, int> items = {};
    final orders = await DatabaseServices().getOrders(eventID: eventID);
    print('1st query done');
    for (var order in orders) {
      print('helo');
      final list = await DatabaseServices().getOrderItems(orderID: order.orderID!);
      print('2nd query done');
      for (var item in list) {
        final itemInfo = await DatabaseServices().getItemByID(itemID: item['item_id']);
        print('3rd query done');
        items.update(itemInfo, (value) {
          return (value + item['quantity']).toInt();
        }, ifAbsent: () {
          return item['quantity'];
        });
      }
    }
    print(items);
    return items;
  }
}
