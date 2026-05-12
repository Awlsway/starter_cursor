import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

enum AppBadgeVariant { neutral, success, warning, danger, info }

class AppBadge extends StatelessWidget {
  const AppBadge({
    required this.label,
    this.variant = AppBadgeVariant.neutral,
    this.icon,
    super.key,
  });

  final String label;
  final AppBadgeVariant variant;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final ({Color bg, Color text, Color border}) palette = _paletteFor(variant);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTokens.spaceSm,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: palette.bg,
        borderRadius: BorderRadius.circular(AppTokens.radiusLg),
        border: Border.all(color: palette.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: 14, color: palette.text),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              color: palette.text,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  ({Color bg, Color text, Color border}) _paletteFor(AppBadgeVariant v) {
    switch (v) {
      case AppBadgeVariant.success:
        return (
          bg: AppTokens.colorStatusSuccess.withValues(alpha: 0.12),
          text: AppTokens.colorStatusSuccess,
          border: AppTokens.colorStatusSuccess.withValues(alpha: 0.35),
        );
      case AppBadgeVariant.warning:
        return (
          bg: AppTokens.colorStatusWarning.withValues(alpha: 0.14),
          text: const Color(0xFF92400E),
          border: AppTokens.colorStatusWarning.withValues(alpha: 0.4),
        );
      case AppBadgeVariant.danger:
        return (
          bg: AppTokens.colorActionDanger.withValues(alpha: 0.12),
          text: AppTokens.colorActionDanger,
          border: AppTokens.colorActionDanger.withValues(alpha: 0.35),
        );
      case AppBadgeVariant.info:
        return (
          bg: AppTokens.colorStatusInfo.withValues(alpha: 0.12),
          text: AppTokens.colorStatusInfo,
          border: AppTokens.colorStatusInfo.withValues(alpha: 0.35),
        );
      case AppBadgeVariant.neutral:
        return (
          bg: AppTokens.colorBorder.withValues(alpha: 0.35),
          text: AppTokens.colorTextSecondary,
          border: AppTokens.colorBorder,
        );
    }
  }
}
