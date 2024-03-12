import 'package:cats_app/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:cats_app/injection_container.dart' as injection_container;
import 'config/theme/app_theme.dart';

void main() {
  injection_container.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'CatsApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
