import 'package:gebly/core/models/database_user.dart';
import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/models/item.dart';
import 'package:gebly/core/models/order.dart';
import 'package:gebly/core/models/restaurant.dart';
import 'package:gebly/core/services/database_tables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseServices {
  final DatabaseTables _tables = DatabaseTables();
  final auth = Supabase.instance.client.auth;

  Future<bool> isUserExist() async {
    final id = auth.currentUser?.id;
    if (id == null) {
      return false;
    }
    var userInfo = await _tables.users.select().eq('id', id);
    if (userInfo.length == 0) {
      return false;
    }
    return true;
  }

  Future<bool> createUser({required DatabaseUser user}) async {
    final id = auth.currentUser?.id;
    if (id == null) {
      throw Exception('User not logged in');
    }
    final response = await _tables.users.insert(user.toJson()).select();
    if (response == null) {
      throw Exception('Error creating user');
    }
    return true;
  }

  Future<Event> getUserActiveEvent() async {
    final userID = auth.currentUser?.id;
    if (userID == null) {
      return Event(
          id: 0,
          bossID: '',
          restaurantID: 0,
          status: '',
          isShare: false,
          totalPrice: 0,
          createdAt: DateTime.now(),
          code: '');
    }
    var userInfo = await _tables.users.select().eq('id', userID);
    if (userInfo[0]['active_event_id'] == null) {
      return Event(
          id: 0,
          bossID: '',
          restaurantID: 0,
          status: '',
          isShare: false,
          totalPrice: 0,
          createdAt: DateTime.now(),
          code: '');
    }
    return await getEventByID(eventID: userInfo[0]['active_event_id']);
  }

  Future updateUserActiveEventID({required int eventID}) async {
    final userID = auth.currentUser!.id;
    await _tables.users.update({'active_event_id': eventID}).eq('id', userID);
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

  Future<Event> createEvent({required Event event}) async {
    final response = await _tables.event.insert(event.toJson()).select();
    if (response == null) {
      throw Exception('Error creating event');
    } else {
      await updateUserActiveEventID(eventID: response[0]['event_id']);
      return Event.fromJson(response[0]);
    }
  }

  Future<int> latestEventID() async {
    var eventInfo = await _tables.event.select().order('event_id', ascending: false).limit(1);
    if (eventInfo.length == 0) {
      return 0;
    }
    return eventInfo[0]['event_id'];
  }

  Future<int> latestOrderID() async {
    var orderInfo = await _tables.order.select().order('order_id', ascending: false).limit(1);
    if (orderInfo.length == 0) {
      return 0;
    }
    return orderInfo[0]['order_id'];
  }

  Future<bool> joinEventByID({required String eventID}) async {
    final userID = auth.currentUser!.id;
    var userInfo = await _tables.users.select().eq('id', userID);
    if (userInfo[0]['active_event_id'] != null) {
      throw Exception('User already in event');
    }
    final response = await _tables.users.update({'active_event_id': eventID}).eq('id', userID);
    if (response == null) {
      throw Exception('Error joining event');
    }
    return true;
  }

  Future<Event> getEventByID({required int eventID}) async {
    var eventInfo = await _tables.event.select().eq('event_id', eventID);
    if (eventInfo.length == 0) {
      throw Exception('Event not found');
    }
    return Event.fromJson(eventInfo[0]);
  }

  Future<Event> getEventByCode({required String code}) async {
    var eventInfo = await _tables.event.select().eq('code', code);
    if (eventInfo.length == 0) {
      throw Exception('Event not found');
    }
    return Event.fromJson(eventInfo[0]);
  }

  Future<List<Restaurant>> getNearRestaurants({int? limit}) async {
    //FIXME: get user location
    List<Restaurant> restaurants = [];
    var restaurantsInfo = await _tables.restaurant.select();
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

  Future<Restaurant> getRestaurantByID({required int restaurantID}) async {
    var restaurantInfo = await _tables.restaurant.select().eq('resturant_id', restaurantID);
    if (restaurantInfo.length == 0) {
      throw Exception('Restaurant not found');
    }
    return Restaurant.fromJson(restaurantInfo[0]);
  }

  Future<List<Item>> getMenu({required int restaurantID}) async {
    List<Item> menu = [];
    var menuInfo = await _tables.item.select().eq('restaurant_id', restaurantID);
    for (var i = 0; i < menuInfo.length; i++) {
      menu.add(Item.fromJson(menuInfo[i]));
    }
    return menu;
  }

  Future<Order> makeOrder({required Order order, required Map<Item, int> items}) async {
    final newOrder = await _tables.order.insert(order.toJson()).select();
    final newOrderID = newOrder[0]['order_id'];
    await addItemsToOrderItemTable(orderID: newOrderID, items: items);
    return Order.fromJson(newOrder[0]);
  }

  Future setDeadline({required String eventID, required String time}) async {
    await _tables.event.update({'deadline': time}).eq('id', eventID);
  }

  Future setEventStatus({required String eventID, required String status}) async {
    await _tables.event.update({'status': status}).eq('id', eventID);
  }

  Future setEventTotalPrice({required String eventID, required double totalPrice}) async {
    await _tables.event.update({'total_price': totalPrice}).eq('id', eventID);
  }

  Future setEventShareStatus({required String eventID, required bool isShare}) async {
    await _tables.event.update({'is_share': isShare}).eq('id', eventID);
  }

  Future<int> latestOrderItem() async {
    var orderItemInfo = await _tables.orderItem.select().order('id', ascending: false).limit(1);
    if (orderItemInfo.length == 0) {
      return 0;
    }
    return orderItemInfo[0]['id'];
  }

  Future addItemsToOrderItemTable({required int orderID, required Map<Item, int> items}) async {
    int latestID = await latestOrderItem();
    for (var i = 0; i < items.length; i++) {
      final item = items.keys.toList()[i];
      if (items[item]! > 0) {
        await _tables.orderItem.insert({
          'order_id': orderID,
          'item_id': item.id,
          'id': latestID + 1 + i,
          'quantity': items[item],
          'created_at': DateTime.now().toIso8601String()
        });
      }
    }
  }

  Future<List<Order>> getOrders({required int eventID}) async {
    List<Order> orders = [];
    var ordersInfo = await _tables.order.select().eq('event_id', eventID);
    for (var i = 0; i < ordersInfo.length; i++) {
      orders.add(Order.fromJson(ordersInfo[i]));
    }
    return orders;
  }

  Future<List<DatabaseUser>> getInvolvedUsers({required int eventID}) async {
    List<DatabaseUser> users = [];
    var usersInfo = await _tables.users.select().eq('active_event_id', eventID);
    for (var i = 0; i < usersInfo.length; i++) {
      users.add(DatabaseUser.fromJson(usersInfo[i]));
    }
    return users;
  }

  Future<List<Map<dynamic, dynamic>>> getOrderItems({required int orderID}) async {
    final x = await _tables.orderItem.select().eq('order_id', orderID);
    print('got x');
    return x;
  }

  Future<Order> getOrder({required String uid, required int eventID}) async {
    var orderInfo = await _tables.order.select().eq('user_id', uid).eq('event_id', eventID);
    if (orderInfo.length == 0) {
      throw Exception('Order not found');
    }
    return Order.fromJson(orderInfo[0]);
  }

  Future<List<Item>> getItems({required Order order}) async {
    List<Item> items = [];
    var itemsInfo = await _tables.orderItem.select().eq('order_id', order.orderID);
    for (var i = 0; i < itemsInfo.length; i++) {
      items.add(await getItemByID(itemID: itemsInfo[i]['item_id']));
    }
    return items;
  }

  Stream getParticipationStatusStream({required String eventID}) {
    return _tables.order.stream(primaryKey: ['order_id']).eq('event_id', eventID);
  }

  Future<Item> getItemByID({required itemID}) async {
    var itemInfo = await _tables.item.select().eq('item_id', itemID);
    if (itemInfo.length == 0) {
      throw Exception('Item not found');
    }
    return Item.fromJson(itemInfo[0]);
  }
}
