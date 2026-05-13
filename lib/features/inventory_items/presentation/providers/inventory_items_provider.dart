import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ansvk_starter/features/inventory_items/data/inventory_items_repository.dart';
import 'package:flutter_ansvk_starter/features/inventory_items/domain/inventory_item.dart';

final inventoryItemsRepositoryProvider = Provider<InventoryItemsRepository>((
  Ref ref,
) {
  return InventoryItemsRepository();
});

class InventoryItemsNotifier extends AsyncNotifier<List<InventoryItem>> {
  @override
  Future<List<InventoryItem>> build() {
    return _repository.getItems();
  }

  InventoryItemsRepository get _repository =>
      ref.read(inventoryItemsRepositoryProvider);

  Future<void> refreshItems() async {
    state = const AsyncValue<List<InventoryItem>>.loading();
    state = await AsyncValue.guard<List<InventoryItem>>(() {
      return _repository.getItems();
    });
  }

  Future<void> createItem({required String name, required int quantity}) async {
    await _repository.createItem(name: name, quantity: quantity);
    await refreshItems();
  }
}

final inventoryItemsProvider =
    AsyncNotifierProvider<InventoryItemsNotifier, List<InventoryItem>>(
        InventoryItemsNotifier.new);
