import 'package:flutter/widgets.dart';
import 'package:gebly/presentation/view/confirm_order_page.dart';
import 'package:gebly/presentation/view/event_info_page.dart';
import 'package:gebly/presentation/view/event_made.dart';
import 'package:gebly/presentation/view/event_order_page.dart';
import 'package:gebly/presentation/view/home_view.dart';
import 'package:gebly/presentation/view/join_event_page.dart';
import 'package:gebly/presentation/view/order_selection.dart';
import 'package:gebly/presentation/view/previous_event_page.dart';
import 'package:gebly/presentation/view/restaurant_selection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/previous-events',
        builder: (context, state) => const PreviousEventPage(),
      ),
      GoRoute(
        path: '/join-event',
        builder: (context, state) => const JoinEventPage(),
      ),
      GoRoute(
        path: '/select-restaurant',
        builder: (context, state) => const RestaurantSelectionPage(),
      ),
      GoRoute(
        path: '/order-selection',
        builder: (context, state) => const OrderSelection(),
      ),
      GoRoute(
        path: '/order-confirm',
        builder: (context, state) => const ConfirmOrderPage(),
      ),
      GoRoute(
        path: '/event-made',
        builder: (context, state) => const EventMadeView(),
      ),
      GoRoute(
        path: '/event-info',
        builder: (context, state) => const EventInfoPage(),
      ),
      GoRoute(
        path: '/event-order',
        builder: (context, state) => const EventOrderPage(),
      ),
    ],
  );
});
