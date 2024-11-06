import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fpdart/fpdart.dart';

import '../../bloc/add_order_bloc.dart';
import '../../bloc/add_order_event.dart';
import '../../bloc/add_order_state.dart';

class SelectCustomerDropDown extends StatelessWidget {
  const SelectCustomerDropDown({
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
        label: Text(
            AppLocalizations.of(context)!.addOrderSelectCustomerFieldLabel),
      ),
      items: state.customers.mapWithIndex(
        (customer, index) {
          return DropdownMenuItem(
            value: customer.name ?? "",
            child: Text(customer.name ?? ""),
          );
        },
      ).toList(),
      onChanged: (value) {
        if (value != null) {
          print(value);
          context.read<AddOrderBloc>().add(CustomerSelected(
              selectedCustomer:
                  state.customers.singleWhere((pro) => pro.name == value)));
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!
              .addOrderSelectCustomerFieldValidationEmptyError;
        }
        return null;
      },
    );
  }
}
