import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/components/app_badge.dart';
import 'package:flutter_ansvk_starter/ui/components/app_button.dart';
import 'package:flutter_ansvk_starter/ui/components/app_card.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class AppTableColumn<T> {
  const AppTableColumn({
    required this.label,
    required this.cellBuilder,
    this.flex = 1,
  });

  final String label;
  final Widget Function(T row) cellBuilder;
  final int flex;
}

class AppTable<T> extends StatelessWidget {
  const AppTable({
    required this.columns,
    required this.rows,
    this.loading = false,
    this.errorText,
    this.onRetry,
    this.emptyText = 'No records found.',
    super.key,
  });

  final List<AppTableColumn<T>> columns;
  final List<T> rows;
  final bool loading;
  final String? errorText;
  final VoidCallback? onRetry;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _TableHeader<T>(columns: columns),
          const Divider(height: 1, color: AppTokens.colorBorder),
          if (loading)
            const Padding(
              padding: EdgeInsets.all(AppTokens.spaceLg),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (errorText != null)
            Padding(
              padding: const EdgeInsets.all(AppTokens.spaceLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppBadge(
                    label: errorText!,
                    variant: AppBadgeVariant.danger,
                    icon: Icons.error_outline,
                  ),
                  if (onRetry != null) ...<Widget>[
                    const SizedBox(height: AppTokens.spaceSm),
                    AppButton(
                      label: 'Retry',
                      variant: AppButtonVariant.secondary,
                      onPressed: onRetry,
                    ),
                  ],
                ],
              ),
            )
          else if (rows.isEmpty)
            Padding(
              padding: const EdgeInsets.all(AppTokens.spaceLg),
              child: AppBadge(
                label: emptyText,
                variant: AppBadgeVariant.info,
                icon: Icons.inbox_outlined,
              ),
            )
          else
            Column(
              children: <Widget>[
                for (int i = 0; i < rows.length; i++) ...<Widget>[
                  _TableRow<T>(columns: columns, row: rows[i]),
                  if (i != rows.length - 1)
                    const Divider(height: 1, color: AppTokens.colorBorder),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

class _TableHeader<T> extends StatelessWidget {
  const _TableHeader({required this.columns});

  final List<AppTableColumn<T>> columns;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTokens.spaceMd),
      color: AppTokens.colorBorder.withValues(alpha: 0.15),
      child: Row(
        children: columns.map((AppTableColumn<T> column) {
          return Expanded(
            flex: column.flex,
            child: Text(
              column.label,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppTokens.colorTextPrimary,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _TableRow<T> extends StatelessWidget {
  const _TableRow({required this.columns, required this.row});

  final List<AppTableColumn<T>> columns;
  final T row;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTokens.spaceMd),
      child: Row(
        children: columns.map((AppTableColumn<T> column) {
          return Expanded(flex: column.flex, child: column.cellBuilder(row));
        }).toList(),
      ),
    );
  }
}
