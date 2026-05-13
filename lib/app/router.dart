import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_ansvk_starter/features/inventory_items/presentation/pages/inventory_item_form_page.dart';
import 'package:flutter_ansvk_starter/features/inventory_items/presentation/pages/inventory_items_list_page.dart';
import 'package:flutter_ansvk_starter/features/home/presentation/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/inventory/items',
      name: 'inventoryItems',
      builder: (BuildContext context, GoRouterState state) {
        return const InventoryItemsListPage();
      },
    ),
    GoRoute(
      path: '/inventory/items/new',
      name: 'inventoryItemCreate',
      builder: (BuildContext context, GoRouterState state) {
        return const InventoryItemFormPage();
      },
    ),
  ],
);
