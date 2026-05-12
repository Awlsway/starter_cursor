import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/app/router.dart';
import 'package:flutter_ansvk_starter/ui/theme/app_theme.dart';

class AnsvkApp extends StatelessWidget {
  const AnsvkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ANSVK Starter',
      theme: appTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
