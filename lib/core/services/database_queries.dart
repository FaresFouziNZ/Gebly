import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/models/order.dart';
import 'package:gebly/core/services/database_tables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseQueries {
  final DatabaseTables _tables = DatabaseTables();
  final auth = Supabase.instance.client.auth;

  Future<String> getUserActiveEventID() async {
    final userID = auth.currentUser!.id;
    var userInfo = await _tables.users.select().eq('id', userID);
    if (userInfo[0]['active_event_id'] == null) {
      throw Exception('User not in event');
    }
    return userInfo[0]['active_event_id'];
  }

  Future<bool> isUserFree() async {
    final userID = auth.currentUser!.id;
    var userInfo = await _tables.users.select().eq('id', userID);
    if (userInfo[0]['active_event_id'] == null) {
      return true;
    }
    return false;
  }

  Future joinEventUsingCode({required String eventID}) async {
    final userID = auth.currentUser!.id;
    var userInfo = await _tables.users.select().eq('id', userID);
    if (userInfo[0]['active_event_id'] != null) {
      throw Exception('User already in event');
    }
    _tables.users.update({'active_event_id': eventID}).eq('id', userID);
  }

  Future<Event> getEventByCode({required String code}) async {
    var eventInfo = await _tables.event.select().eq('code', code);
    if (eventInfo.length == 0) {
      throw Exception('Event not found');
    }
    return Event.fromJson(eventInfo[0]);
  }

  Future getNearRestaurants() async {
    //FIXME: get user location
    var restaurants = await _tables.restaurant.select().limit(10);
    return restaurants;
  }

  Future<List<Item>> getMenu({required int restaurantID}) async {
    List<Item> menu = [];
    var menuInfo = await _tables.item.select().eq('restaurant_id', restaurantID);
    for (var i = 0; i < menu.length; i++) {
      menu.add(Item.fromJson(menuInfo[i]));
    }
    return menu;
  }

  Future makeOrder({required Order order, required List<Item> items}) async {
    final newOrderID = await _tables.order.insert(order.toJson()).select();
    await addItemsToOrderItemTable(orderID: newOrderID, items: items);
  }

}
