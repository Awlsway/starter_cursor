import 'dart:async';

import 'package:flutter_ansvk_starter/features/inventory_items/domain/inventory_item.dart';

class InventoryItemsRepository {
  final List<InventoryItem> _items = <InventoryItem>[
    const InventoryItem(
        id: 'item-1', name: 'Medical Gloves', quantity: 120, isActive: true),
    const InventoryItem(
        id: 'item-2', name: 'Syringes', quantity: 350, isActive: true),
    const InventoryItem(
        id: 'item-3', name: 'Sterile Gauze', quantity: 0, isActive: false),
  ];

  Future<List<InventoryItem>> getItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return List<InventoryItem>.from(_items);
  }

  Future<void> createItem({
    required String name,
    required int quantity,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    final String id = 'item-${DateTime.now().millisecondsSinceEpoch}';
    _items.insert(
      0,
      InventoryItem(id: id, name: name, quantity: quantity, isActive: true),
    );
  }
}
