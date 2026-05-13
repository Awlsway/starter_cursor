import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/components/app_badge.dart';

enum AppSyncStatus { online, syncing, offline }

class AppSyncIndicator extends StatelessWidget {
  const AppSyncIndicator({
    required this.status,
    this.showLabel = true,
    super.key,
  });

  final AppSyncStatus status;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case AppSyncStatus.online:
        return AppBadge(
          label: showLabel ? 'Online' : '',
          variant: AppBadgeVariant.success,
          icon: Icons.cloud_done_outlined,
        );
      case AppSyncStatus.syncing:
        return const _SyncingBadge();
      case AppSyncStatus.offline:
        return AppBadge(
          label: showLabel ? 'Offline' : '',
          variant: AppBadgeVariant.danger,
          icon: Icons.cloud_off_outlined,
        );
    }
  }
}

class _SyncingBadge extends StatelessWidget {
  const _SyncingBadge();

  @override
  Widget build(BuildContext context) {
    return const AppBadge(
      label: 'Syncing',
      variant: AppBadgeVariant.info,
      icon: Icons.sync,
    );
  }
}
