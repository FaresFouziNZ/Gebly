import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventInfoViewModel {
  void joinEvent(WidgetRef ref, Event event) async {
    await DatabaseServices().updateUserActiveEventID(eventID: event.id!);
  }
}
