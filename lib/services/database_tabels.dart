import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseTables {
  static final _instance = Supabase.instance.client;
  final users = _instance.from('users');
}
