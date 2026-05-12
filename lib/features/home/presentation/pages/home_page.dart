import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/components/components.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppTokens.spaceXl),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
