import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';
import 'package:order_app_demo/add_order/presentation/components/error_section.dart';
import 'package:order_app_demo/add_order/presentation/components/order_list.dart';
import 'package:order_app_demo/add_order/presentation/components/sign_section.dart';

import '../components/add_order_form.dart';

class AddOrderView extends StatefulWidget {
  AddOrderView({super.key});

  @override
  State<AddOrderView> createState() => _AddOrderViewState();
}

class _AddOrderViewState extends State<AddOrderView> {
  final formKey = GlobalKey<FormState>();

  final quantityController = TextEditingController();

  bool showSubtract = false;
  bool showRemove = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations!.addOrderAppbarTitle),
      ),
      body: BlocBuilder<AddOrderBloc, AddOrderState>(
        builder: (context, state) {
          return state.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.error != ""
                  ? const ErrorSection()
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildAddOrderForm(
                              context,
                              state,
                              formKey,
                              _scrollController,
                              quantityController,
                              () => {
                                    setState(() {
                                      showSubtract = !showSubtract;
                                    })
                                  },
                              () => {
                                    setState(() {
                                      showRemove = !showRemove;
                                    })
                                  }),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: OrderList(
                              state: state,
                              scrollController: _scrollController,
                              showSubtract: showSubtract,
                              showRemove: showRemove,
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
      bottomNavigationBar: BlocBuilder<AddOrderBloc, AddOrderState>(
        builder: (context, state) {
          return SignSection(
            state: state,
          );
        },
      ),
    );
  }
}
