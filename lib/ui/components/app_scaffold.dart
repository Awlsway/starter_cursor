import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    this.padding = const EdgeInsets.all(AppTokens.spaceXl),
    this.backgroundColor = AppTokens.colorBgApp,
    this.safeArea = true,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final bool safeArea;

  @override
  Widget build(BuildContext context) {
    Widget body = Padding(
      padding: padding,
      child: child,
    );

    if (safeArea) {
      body = SafeArea(child: body);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
