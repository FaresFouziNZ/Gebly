import 'package:flutter/widgets.dart';
import 'package:gebly/presentation/view/home_view.dart';
import 'package:gebly/presentation/view/signup_view.dart';

import 'package:gebly/presentation/view/order_selection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/view/event_made.dart';
import '../../presentation/view/login_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
});
