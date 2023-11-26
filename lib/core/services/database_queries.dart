import 'package:gebly/core/services/database_tabels.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseQueries {
  // DatabaseQueries(this.ref);
  // final ProviderContainer ref;
  final DatabaseTables _tables = DatabaseTables();
  final auth = Supabase.instance.client.auth;
  Future getUserActiveEvent() async {
    //FIXME
    final userID = auth.currentUser!.id;
    var activeEventID = await _tables.users.select('SELECT active_event').eq('id', userID);
    return activeEventID;
  }
}
