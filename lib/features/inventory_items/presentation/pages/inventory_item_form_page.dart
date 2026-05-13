import 'package:flutter/material.dart';
import 'package:flutter_ansvk_starter/ui/components/components.dart';
import 'package:flutter_ansvk_starter/ui/tokens/design_tokens.dart';

class InventoryItemFormPage extends StatefulWidget {
  const InventoryItemFormPage({super.key});

  @override
  State<InventoryItemFormPage> createState() => _InventoryItemFormPageState();
}

class _InventoryItemFormPageState extends State<InventoryItemFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String _selectedCategory = 'medical';

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Create Inventory Item',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppTokens.colorTextPrimary,
                  ),
                ),
                const SizedBox(height: AppTokens.spaceLg),
                AppTextField(
                  controller: _nameController,
                  label: 'Item name',
                  hint: 'e.g. IV Cannula',
                ),
                const SizedBox(height: AppTokens.spaceMd),
                AppTextField(
                  controller: _quantityController,
                  label: 'Quantity',
                  hint: 'e.g. 120',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: AppTokens.spaceMd),
                AppDropdown<String>(
                  value: _selectedCategory,
                  label: 'Category',
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'medical',
                      child: Text('Medical supplies'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'injection',
                      child: Text('Injection & infusion'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'consumable',
                      child: Text('General consumables'),
                    ),
                  ],
                  onChanged: (String? value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
                const SizedBox(height: AppTokens.spaceLg),
                Wrap(
                  spacing: AppTokens.spaceSm,
                  children: <Widget>[
                    AppButton(
                      label: 'Back',
                      variant: AppButtonVariant.secondary,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    AppButton(
                      label: 'Save (stub)',
                      onPressed: () {
                        AppSnackbar.show(
                          context,
                          message:
                              'Hook this form to provider action in your module.',
                          type: AppSnackbarType.info,
                        );
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
