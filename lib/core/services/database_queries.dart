import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/models/order.dart';
import 'package:gebly/core/models/restaurant.dart';
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

  Future<bool> isUserFree({String userID = ''}) async {
    if (userID == '') {
      userID = auth.currentUser!.id;
    }
    var userInfo = await _tables.users.select().eq('id', userID);
    if (userInfo[0]['active_event_id'] == null) {
      return true;
    }
    return false;
  }

  Future<bool> createEvent({required Event event}) async {
    final response = await _tables.event.insert(event.toJson());
    if (response.error != null) {
      throw Exception('Error creating event');
    } else {
      return true;
    }
  }

  Future<bool> joinEventByID({required String eventID}) async {
    final userID = auth.currentUser!.id;
    var userInfo = await _tables.users.select().eq('id', userID);
    if (userInfo[0]['active_event_id'] != null) {
      throw Exception('User already in event');
    }
    final response = await _tables.users.update({'active_event_id': eventID}).eq('id', userID);
    if (response.error != null) {
      throw Exception('Error joining event');
    }
    return true;
  }

  Future<Event> getEventByCode({required String code}) async {
    var eventInfo = await _tables.event.select().eq('code', code);
    if (eventInfo.length == 0) {
      throw Exception('Event not found');
    }
    return Event.fromJson(eventInfo[0]);
  }

  Future<List<Restaurant>> getNearRestaurants() async {
    //FIXME: get user location
    List<Restaurant> restaurants = [];
    var restaurantsInfo = await _tables.restaurant.select().limit(10);
    for (var i = 0; i < restaurantsInfo.length; i++) {
      restaurants.add(Restaurant.fromJson(restaurantsInfo[i]));
    }
    return restaurants;
  }

  Future<List<Restaurant>> searchRestaurant({required String searchQuery}) async {
    List<Restaurant> restaurants = [];
    var restaurantsInfo = await _tables.restaurant.select().ilike('name', '%$searchQuery%').limit(10);
    for (var i = 0; i < restaurantsInfo.length; i++) {
      restaurants.add(Restaurant.fromJson(restaurantsInfo[i]));
    }
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

  Future<String> makeOrder({required Order order, required List<Item> items}) async {
    final newOrderID = await _tables.order.insert(order.toJson()).select();
    await addItemsToOrderItemTable(orderID: newOrderID, items: items);
    return newOrderID;
  }

  Future setDeadline({required String eventID, required String time}) async {
    await _tables.event.update({'deadline': time}).eq('id', eventID);
  }

  Future addItemsToOrderItemTable({required String orderID, required List<Item> items}) async {
    for (var i = 0; i < items.length; i++) {
      _tables.orderItem.insert({'order_id': orderID, 'item_id': items[i].id});
    }
  }

  Future<List<Order>> getOrders({required String eventID}) async {
    List<Order> orders = [];
    var ordersInfo = await _tables.order.select().eq('event_id', eventID);
    for (var i = 0; i < ordersInfo.length; i++) {
      orders.add(Order.fromJson(ordersInfo[i]));
    }
    return orders;
  }

  Stream getParticipationStatusStream({required String eventID}) {
    return _tables.order.stream(primaryKey: ['order_id']).eq('event_id', eventID);
  }
}
