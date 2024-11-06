import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fpdart/fpdart.dart';

import '../../bloc/add_order_bloc.dart';
import '../../bloc/add_order_event.dart';
import '../../bloc/add_order_state.dart';

class SelectProductDropDown extends StatelessWidget {
  const SelectProductDropDown({
    super.key,
    required this.state,
  });

  final AddOrderState state;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
      elevation: 100,
      decoration: InputDecoration(
        label:
            Text(AppLocalizations.of(context)!.addOrderSelectProductFieldLabel),
      ),
      items: state.products.mapWithIndex(
        (product, index) {
          return DropdownMenuItem(
            value: product.name ?? "",
            child: Text(product.name ?? ""),
          );
        },
      ).toList(),
      onChanged: (value) {
        if (value != null) {
          context.read<AddOrderBloc>().add(ProductSelected(
              selectedProduct:
                  state.products.singleWhere((pro) => pro.name == value)));
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!
              .addOrderSelectProductFieldValidationEmptyError;
        }
        return null;
      },
    );
  }
}
