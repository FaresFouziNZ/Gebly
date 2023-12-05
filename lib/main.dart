import 'package:flutter/material.dart';
import 'package:gebly/constants/themes.dart';
import 'package:gebly/core/providers/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'constants/credentials.dart' as credentials;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: credentials.url,
    anonKey: credentials.anonKey,
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(colorScheme: lightColorScheme, scaffoldBackgroundColor: const Color(0xFFFFEEDE)),
      darkTheme: ThemeData(colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
    );
  }
}
