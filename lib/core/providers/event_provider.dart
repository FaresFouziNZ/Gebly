import 'package:gebly/core/models/event.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eventProvider = StateProvider(
  (ref) => Event(
    id: -1,
    bossID: '',
    restaurantID: 0,
    createdAt: DateTime.now(),
    deadline: DateTime.now(),
    status: '',
    isShare: false,
    totalPrice: 0.0,
    code: '',
  ),
);

final eventFuture = FutureProvider<Event>((ref) async {
  return await DatabaseServices().getUserActiveEvent();
});
