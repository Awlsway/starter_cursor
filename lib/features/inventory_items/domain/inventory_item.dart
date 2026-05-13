class InventoryItem {
  const InventoryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.isActive,
  });

  final String id;
  final String name;
  final int quantity;
  final bool isActive;

  InventoryItem copyWith({
    String? id,
    String? name,
    int? quantity,
    bool? isActive,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      isActive: isActive ?? this.isActive,
    );
  }
}
