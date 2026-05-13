import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_ansvk_starter/features/inventory_items/domain/inventory_item.dart';
import 'package:flutter_ansvk_starter/features/inventory_items/presentation/providers/inventory_items_provider.dart';
import 'package:flutter_ansvk_starter/ui/components/components.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class InventoryItemsListPage extends ConsumerWidget {
  const InventoryItemsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<InventoryItem>> itemsAsync =
        ref.watch(inventoryItemsProvider);

    return AppScaffold(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 960),
        child: AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Text(
                      'Inventory Items Template',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppTokens.colorTextPrimary,
                      ),
                    ),
                  ),
                  const AppSyncIndicator(status: AppSyncStatus.online),
                  const SizedBox(width: AppTokens.spaceSm),
                  AppButton(
                    label: 'New item',
                    leadingIcon: Icons.add,
                    onPressed: () => context.push('/inventory/items/new'),
                  ),
                ],
              ),
              const SizedBox(height: AppTokens.spaceLg),
              itemsAsync.when(
                loading: () => const AppTable<InventoryItem>(
                  columns: <AppTableColumn<InventoryItem>>[
                    AppTableColumn<InventoryItem>(
                      label: 'Item',
                      cellBuilder: _placeholderCell,
                      flex: 3,
                    ),
                    AppTableColumn<InventoryItem>(
                      label: 'Quantity',
                      cellBuilder: _placeholderCell,
                    ),
                    AppTableColumn<InventoryItem>(
                      label: 'Status',
                      cellBuilder: _placeholderCell,
                    ),
                  ],
                  rows: <InventoryItem>[],
                  loading: true,
                ),
                error: (Object error, StackTrace stackTrace) {
                  return AppTable<InventoryItem>(
                    columns: const <AppTableColumn<InventoryItem>>[
                      AppTableColumn<InventoryItem>(
                        label: 'Item',
                        cellBuilder: _placeholderCell,
                        flex: 3,
                      ),
                      AppTableColumn<InventoryItem>(
                        label: 'Quantity',
                        cellBuilder: _placeholderCell,
                      ),
                      AppTableColumn<InventoryItem>(
                        label: 'Status',
                        cellBuilder: _placeholderCell,
                      ),
                    ],
                    rows: const <InventoryItem>[],
                    errorText: 'Error loading items',
                    onRetry: () {
                      ref.read(inventoryItemsProvider.notifier).refreshItems();
                    },
                  );
                },
                data: (List<InventoryItem> items) {
                  return AppTable<InventoryItem>(
                    columns: const <AppTableColumn<InventoryItem>>[
                      AppTableColumn<InventoryItem>(
                        label: 'Item',
                        cellBuilder: _itemNameCell,
                        flex: 3,
                      ),
                      AppTableColumn<InventoryItem>(
                        label: 'Quantity',
                        cellBuilder: _quantityCell,
                      ),
                      AppTableColumn<InventoryItem>(
                        label: 'Status',
                        cellBuilder: _statusCell,
                      ),
                    ],
                    rows: items,
                    emptyText: 'No items yet',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _placeholderCell(InventoryItem _) {
  return const SizedBox.shrink();
}

Widget _itemNameCell(InventoryItem item) {
  return Text(
    item.name,
    style: const TextStyle(
      fontWeight: FontWeight.w600,
      color: AppTokens.colorTextPrimary,
    ),
  );
}

Widget _quantityCell(InventoryItem item) {
  return Text('Qty: ${item.quantity}');
}

Widget _statusCell(InventoryItem item) {
  return AppBadge(
    label: item.isActive ? 'Active' : 'Inactive',
    variant: item.isActive ? AppBadgeVariant.success : AppBadgeVariant.neutral,
  );
}
