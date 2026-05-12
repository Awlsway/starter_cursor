import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/components/components.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: AppCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'ANSVK Starter Home',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTokens.colorTextPrimary,
                  ),
                ),
                const SizedBox(height: AppTokens.spaceMd),
                const Text(
                  'Reusable UI components are wired. Start building your first feature module.',
                ),
                const SizedBox(height: AppTokens.spaceLg),
                const AppTextField(
                  label: 'Quick note',
                  hint: 'Type to test starter field component',
                  prefixIcon: Icon(Icons.edit_outlined),
                ),
                const SizedBox(height: AppTokens.spaceLg),
                const Wrap(
                  spacing: AppTokens.spaceSm,
                  runSpacing: AppTokens.spaceSm,
                  children: <Widget>[
                    AppBadge(label: 'Neutral'),
                    AppBadge(
                      label: 'Active',
                      variant: AppBadgeVariant.success,
                      icon: Icons.check_circle_outline,
                    ),
                    AppBadge(
                      label: 'Pending',
                      variant: AppBadgeVariant.warning,
                      icon: Icons.schedule_outlined,
                    ),
                    AppBadge(
                      label: 'Offline',
                      variant: AppBadgeVariant.danger,
                      icon: Icons.wifi_off_outlined,
                    ),
                  ],
                ),
                const SizedBox(height: AppTokens.spaceLg),
                Wrap(
                  spacing: AppTokens.spaceSm,
                  runSpacing: AppTokens.spaceSm,
                  children: <Widget>[
                    AppButton(
                      label: 'Primary Action',
                      onPressed: () {},
                      leadingIcon: Icons.add,
                    ),
                    AppButton(
                      label: 'Secondary',
                      variant: AppButtonVariant.secondary,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: 'Danger',
                      variant: AppButtonVariant.danger,
                      onPressed: () {},
                    ),
                    AppButton(
                      label: 'Open Dialog',
                      variant: AppButtonVariant.text,
                      onPressed: () async {
                        final bool? confirmed = await AppDialog.showConfirm(
                          context,
                          title: 'Starter Dialog',
                          message:
                              'This confirms the reusable AppDialog component is wired correctly.',
                          confirmLabel: 'Confirm',
                          cancelLabel: 'Close',
                        );

                        if (!context.mounted) return;
                        if (confirmed == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Confirmed')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
