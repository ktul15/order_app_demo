import 'package:flutter/cupertino.dart';
import 'package:order_app_demo/add_order/presentation/components/buttons/remove_button.dart';
import 'package:order_app_demo/add_order/presentation/components/buttons/subtract_button.dart';
import 'package:order_app_demo/add_order/presentation/components/quantity_field.dart';

import '../bloc/add_order_state.dart';
import 'buttons/add_button.dart';
import 'dropdowns/select_category.dart';
import 'dropdowns/select_customer.dart';
import 'dropdowns/select_product.dart';

Form buildAddOrderForm(
  BuildContext context,
  AddOrderState state,
  GlobalKey<FormState> formKey,
  ScrollController _scrollController,
  TextEditingController quantityController,
  Function subtractOnPressed,
  Function removeOnPressed,
) {
  return Form(
    key: formKey,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SelectCustomerDropDown(state: state),
          const SizedBox(
            height: 4,
          ),
          SelectCategoryDropDown(state: state),
          const SizedBox(
            height: 4,
          ),
          SelectProductDropDown(state: state),
          const SizedBox(
            height: 4,
          ),
          QuantityField(quantityController: quantityController),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddButton(
                formKey: formKey,
                quantityController: quantityController,
                scrollController: _scrollController,
              ),
              SubtractButton(onPressed: subtractOnPressed),
              RemoveButton(onPressed: removeOnPressed),
            ],
          ),
        ],
      ),
    ),
  );
}
