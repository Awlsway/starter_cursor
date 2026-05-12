import 'package:flutter/material.dart';

import '../ui/theme/app_theme.dart';
import 'router.dart';

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
