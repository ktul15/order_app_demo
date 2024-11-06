import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

import '../../../router/path_constants.dart';
import '../bloc/add_order_bloc.dart';
import '../bloc/add_order_event.dart';
import 'common_button.dart';
import 'common_small_icon.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.state,
    required this.scrollController,
    required this.showSubtract,
    required this.showRemove,
  });

  final AddOrderState state;
  final ScrollController scrollController;
  final bool showSubtract;
  final bool showRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.grey.shade800,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!
                    .addOrderOrderListTitleRowNameLabel,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                AppLocalizations.of(context)!.addOrderOrderListTitleRowQtyLabel,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ),
        Expanded(
          child: state.unitsAdded.length == 0
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!
                        .addOrderOrderListNoProductsText,
                  ),
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: state.unitsAdded.length,
                  itemBuilder: (context, index) {
                    final name = state.unitsAdded[index].product.name;
                    final quantity = state.unitsAdded[index].quantity;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name ?? ""),
                          Expanded(child: Container()),
                          Text(quantity.toString()),
                          const SizedBox(
                            width: 12,
                          ),
                          showSubtract == true
                              ? SmallIcon(
                                  onTap: () {
                                    context.read<AddOrderBloc>().add(
                                          QuantitySubtracted(
                                            index: index,
                                          ),
                                        );
                                  },
                                  iconData: Icons.remove,
                                )
                              : Container(
                                  padding: EdgeInsets.zero,
                                  height: 0,
                                  width: 0,
                                ),
                          showSubtract == true
                              ? const SizedBox(
                                  width: 16,
                                )
                              : Container(),
                          showRemove == true
                              ? SmallIcon(
                                  onTap: () {
                                    context.read<AddOrderBloc>().add(
                                          UnitRemoved(
                                            index: index,
                                          ),
                                        );
                                  },
                                  iconData: Icons.close,
                                )
                              : Container(
                                  padding: EdgeInsets.zero,
                                  height: 0,
                                  width: 0,
                                ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        state.unitsAdded.isNotEmpty
            ? const SizedBox(
                height: 16,
              )
            : Container(),
        state.unitsAdded.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  bottom: 16,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CommonButton(
                    onPressed: () {
                      context.pushNamed(PathConstants.orderDetails, extra: {
                        "customer": state.selectedCustomer,
                        "units": state.unitsAdded,
                      });
                    },
                    text: AppLocalizations.of(context)!
                        .addOrderOrderListViewOrderDetailsButton,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
