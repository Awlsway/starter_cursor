import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppTokens.colorBgApp,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppTokens.colorActionPrimary,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: AppTokens.textBodySize,
      height: AppTokens.textBodyLineHeight,
      fontWeight: FontWeight.w400,
      color: AppTokens.colorTextPrimary,
    ),
  ),
);
