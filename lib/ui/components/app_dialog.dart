import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/components/app_button.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    required this.title,
    this.message,
    this.content,
    this.cancelLabel = 'Cancel',
    this.confirmLabel = 'Confirm',
    this.onCancel,
    this.onConfirm,
    this.confirmVariant = AppButtonVariant.primary,
    this.isLoading = false,
    super.key,
  }) : assert(message != null || content != null);

  final String title;
  final String? message;
  final Widget? content;
  final String cancelLabel;
  final String confirmLabel;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final AppButtonVariant confirmVariant;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTokens.colorSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTokens.radiusLg),
      ),
      titlePadding: const EdgeInsets.fromLTRB(
        AppTokens.spaceXl,
        AppTokens.spaceXl,
        AppTokens.spaceXl,
        AppTokens.spaceSm,
      ),
      contentPadding: const EdgeInsets.fromLTRB(
        AppTokens.spaceXl,
        0,
        AppTokens.spaceXl,
        AppTokens.spaceLg,
      ),
      actionsPadding: const EdgeInsets.fromLTRB(
        AppTokens.spaceMd,
        0,
        AppTokens.spaceMd,
        AppTokens.spaceMd,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppTokens.colorTextPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: content ?? Text(message!),
      actions: <Widget>[
        AppButton(
          label: cancelLabel,
          variant: AppButtonVariant.secondary,
          onPressed: onCancel ?? () => Navigator.of(context).pop(false),
        ),
        AppButton(
          label: confirmLabel,
          variant: confirmVariant,
          loading: isLoading,
          onPressed: isLoading
              ? null
              : (onConfirm ?? () => Navigator.of(context).pop(true)),
        ),
      ],
    );
  }

  static Future<bool?> showConfirm(
    BuildContext context, {
    required String title,
    String? message,
    Widget? content,
    String cancelLabel = 'Cancel',
    String confirmLabel = 'Confirm',
    AppButtonVariant confirmVariant = AppButtonVariant.primary,
    bool barrierDismissible = false,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext dialogContext) {
        return AppDialog(
          title: title,
          message: message,
          content: content,
          cancelLabel: cancelLabel,
          confirmLabel: confirmLabel,
          confirmVariant: confirmVariant,
        );
      },
    );
  }
}
