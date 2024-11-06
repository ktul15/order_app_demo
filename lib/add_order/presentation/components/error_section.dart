import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/add_order_bloc.dart';
import '../bloc/add_order_event.dart';

class ErrorSection extends StatelessWidget {
  const ErrorSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: () {
            context.read<AddOrderBloc>().add(AddOrderGetCustomersLoaded());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.refresh,
                size: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context)!.addOrderErrorText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
