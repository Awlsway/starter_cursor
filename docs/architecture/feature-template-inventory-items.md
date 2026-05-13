# Feature Template: inventory_items

## Brief introduction
This module is the canonical starter pattern for a real feature in this template. Clone this structure when creating new features so state, routing, data, and UI remain consistent.

## Included
- Domain model: `domain/inventory_item.dart`
- Data stub repo: `data/inventory_items_repository.dart`
- Riverpod state: `presentation/providers/inventory_items_provider.dart`
- List page: `presentation/pages/inventory_items_list_page.dart`
- Form page: `presentation/pages/inventory_item_form_page.dart`
- Routes: `/inventory/items` and `/inventory/items/new`

## How to reuse
1. Copy `inventory_items` to your new feature folder.
2. Rename model/repository/provider/page classes.
3. Register routes in `lib/app/router.dart`.
4. Replace data stub with real API/database implementation.
