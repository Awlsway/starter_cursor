import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

enum AppButtonVariant { primary, secondary, danger, text }

enum AppButtonSize { sm, md, lg }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.leadingIcon,
    this.fullWidth = false,
    this.loading = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? leadingIcon;
  final bool fullWidth;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || loading;
    final ButtonStyle style = _styleFor(variant, size);
    final Widget child = _buildChild(isDisabled);

    final Widget button = ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: style,
      child: child,
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }

  Widget _buildChild(bool isDisabled) {
    if (loading) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    final List<Widget> rowChildren = <Widget>[];
    if (leadingIcon != null) {
      rowChildren.add(Icon(leadingIcon, size: 18));
      rowChildren.add(const SizedBox(width: AppTokens.spaceSm));
    }
    rowChildren.add(
      Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: AppTokens.textButtonSize,
          fontWeight: FontWeight.w600,
          color: _textColorFor(variant, isDisabled),
        ),
      ),
    );
    return Row(mainAxisSize: MainAxisSize.min, children: rowChildren);
  }

  ButtonStyle _styleFor(AppButtonVariant v, AppButtonSize s) {
    final EdgeInsetsGeometry padding = switch (s) {
      AppButtonSize.sm => const EdgeInsets.symmetric(
          horizontal: AppTokens.spaceMd,
          vertical: AppTokens.spaceSm,
        ),
      AppButtonSize.md => const EdgeInsets.symmetric(
          horizontal: AppTokens.spaceLg,
          vertical: AppTokens.spaceSm,
        ),
      AppButtonSize.lg => const EdgeInsets.symmetric(
          horizontal: AppTokens.spaceXl,
          vertical: AppTokens.spaceMd,
        ),
    };

    return ElevatedButton.styleFrom(
      elevation: 0,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
      ),
      backgroundColor: _backgroundColorFor(v),
      foregroundColor: _foregroundColorFor(v),
      side: _borderFor(v),
      disabledBackgroundColor: AppTokens.colorBorder,
      disabledForegroundColor: AppTokens.colorTextPrimary.withValues(
        alpha: 0.55,
      ),
    );
  }

  Color _backgroundColorFor(AppButtonVariant v) {
    switch (v) {
      case AppButtonVariant.primary:
        return AppTokens.colorActionPrimary;
      case AppButtonVariant.secondary:
        return AppTokens.colorSurface;
      case AppButtonVariant.danger:
        return AppTokens.colorActionDanger;
      case AppButtonVariant.text:
        return Colors.transparent;
    }
  }

  Color _foregroundColorFor(AppButtonVariant v) {
    switch (v) {
      case AppButtonVariant.primary:
      case AppButtonVariant.danger:
        return Colors.white;
      case AppButtonVariant.secondary:
      case AppButtonVariant.text:
        return AppTokens.colorTextPrimary;
    }
  }

  Color _textColorFor(AppButtonVariant v, bool isDisabled) {
    if (isDisabled) {
      return AppTokens.colorTextPrimary.withValues(alpha: 0.55);
    }
    return _foregroundColorFor(v);
  }

  BorderSide? _borderFor(AppButtonVariant v) {
    switch (v) {
      case AppButtonVariant.secondary:
        return const BorderSide(color: AppTokens.colorBorder);
      case AppButtonVariant.primary:
      case AppButtonVariant.danger:
      case AppButtonVariant.text:
        return null;
    }
  }
}
