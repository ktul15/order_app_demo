import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuantityField extends StatelessWidget {
  const QuantityField({
    super.key,
    required this.quantityController,
  });

  final TextEditingController quantityController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: quantityController,
      decoration: InputDecoration(
        label: Text(
          AppLocalizations.of(context)!.addOrderSelectQuantityFieldLabel,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!
              .addOrderSelectQuantityFieldValidationEmptyError;
        } else if (int.tryParse(value) == null) {
          return AppLocalizations.of(context)!
              .addOrderSelectQuantityFieldValidationInvalidError;
        }
      },
    );
  }
}
