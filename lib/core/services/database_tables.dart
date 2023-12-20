import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseTables {
  static final _instance = Supabase.instance.client;
  final event = _instance.from('event');
  final invite = _instance.from('invite');
  final item = _instance.from('item');
  final order = _instance.from('order');
  final orderItem = _instance.from('order_items');
  final payment = _instance.from('payment');
  final restaurant = _instance.from('restaurant');
  final users = _instance.from('users');
}
