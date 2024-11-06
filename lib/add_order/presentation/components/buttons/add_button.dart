import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/add_order_bloc.dart';
import '../../bloc/add_order_event.dart';
import '../common_button.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.formKey,
    required this.quantityController,
    required this.scrollController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController quantityController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {
        if (formKey.currentState?.validate() == true) {
          FocusScope.of(context).requestFocus(FocusNode());
          context
              .read<AddOrderBloc>()
              .add(UnitAdded(quantity: quantityController.text));
        }
      },
      text: AppLocalizations.of(context)!.addOrderAddButtonText,
    );
  }
}
