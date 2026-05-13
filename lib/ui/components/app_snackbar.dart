import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

enum AppSnackbarType { info, success, warning, danger }

class AppSnackbar {
  const AppSnackbar._();

  static void show(
    BuildContext context, {
    required String message,
    AppSnackbarType type = AppSnackbarType.info,
  }) {
    final ({Color bg, Color fg}) palette = _palette(type);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: palette.bg,
        content: Text(
          message,
          style: TextStyle(color: palette.fg),
        ),
      ),
    );
  }

  static ({Color bg, Color fg}) _palette(AppSnackbarType type) {
    switch (type) {
      case AppSnackbarType.success:
        return (bg: AppTokens.colorStatusSuccess, fg: Colors.white);
      case AppSnackbarType.warning:
        return (bg: AppTokens.colorStatusWarning, fg: Colors.black87);
      case AppSnackbarType.danger:
        return (bg: AppTokens.colorActionDanger, fg: Colors.white);
      case AppSnackbarType.info:
        return (bg: AppTokens.colorStatusInfo, fg: Colors.white);
    }
  }
}
