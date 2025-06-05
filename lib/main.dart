import 'package:flutter/material.dart';
import 'package:gebly/constants/themes.dart';
import 'package:gebly/core/providers/app_router.dart';
import 'package:gebly/core/providers/cart_provider.dart';
import 'package:gebly/core/providers/event_provider.dart';
import 'package:gebly/core/services/database_queries.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'constants/credentials.dart' as credentials;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: credentials.url, anonKey: credentials.anonKey);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    loadEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    // DatabaseServices().getUserActiveEvent();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(colorScheme: lightColorScheme, scaffoldBackgroundColor: const Color(0xFFFFEEDE)),
      darkTheme: ThemeData(colorScheme: darkColorScheme),
      themeMode: ThemeMode.light,
    );
  }

  void loadEvent() async {
    final event = await DatabaseServices().getUserActiveEvent();
    if (event.id! > 0) {
      final cart = await DatabaseServices().getCart(eventID: event.id!);
      ref.read(cartProvider.notifier).state = cart;
    }
    ref.read(eventProvider.notifier).state = event;
    setState(() {});
  }
}
