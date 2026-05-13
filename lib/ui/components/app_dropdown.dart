import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    required this.items,
    required this.onChanged,
    this.value,
    this.label,
    this.hint,
    this.enabled = true,
    super.key,
  });

  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final T? value;
  final String? label;
  final String? hint;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTokens.radiusMd),
      borderSide: const BorderSide(color: AppTokens.colorBorder),
    );

    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      onChanged: enabled ? onChanged : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        isDense: true,
        filled: true,
        fillColor: AppTokens.colorSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTokens.spaceMd,
          vertical: AppTokens.spaceMd,
        ),
        hintStyle: const TextStyle(color: AppTokens.colorTextSecondary),
        labelStyle: const TextStyle(color: AppTokens.colorTextSecondary),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppTokens.colorBorderFocus),
        ),
      ),
      style: const TextStyle(
        fontSize: AppTokens.textBodySize,
        color: AppTokens.colorTextPrimary,
      ),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
    );
  }
}
