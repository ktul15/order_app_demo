import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/add_order_bloc.dart';
import '../../bloc/add_order_event.dart';
import '../../bloc/add_order_state.dart';

class SelectCategoryDropDown extends StatelessWidget {
  const SelectCategoryDropDown({
    super.key,
    required this.state,
  });

  final AddOrderState state;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // width: MediaQuery.of(context).size.width,
      menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
      elevation: 100,
      decoration: InputDecoration(
        label: Text(
            AppLocalizations.of(context)!.addOrderSelectCategoryFieldLabel),
      ),
      items: state.categories.map(
        (category) {
          return DropdownMenuItem(
            value: category ?? "",
            child: Text(category),
          );
        },
      ).toList(),
      onChanged: (value) {
        if (value != null) {
          print(value);
          context.read<AddOrderBloc>().add(CategorySelected(
              selectedCategory:
                  state.categories.singleWhere((cat) => cat == value)));
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!
              .addOrderSelectCategoryFieldValidationEmptyError;
        }
        return null;
      },
    );
  }
}
