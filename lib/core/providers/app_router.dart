import 'package:flutter/widgets.dart';
import 'package:gebly/presentation/view/join_event_page.dart';
import 'package:gebly/presentation/view/order_selection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const JoinEventPage(),
      ),
    ],
  );
});
