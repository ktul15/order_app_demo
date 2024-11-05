import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:go_router/go_router.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';
import 'package:order_app_demo/router/path_constants.dart';
import 'package:order_app_demo/utils/app_colors.dart';

import '../bloc/add_order_event.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Order"),
      ),
      body: BlocBuilder<AddOrderBloc, AddOrderState>(builder: (context, state) {
        return state.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildAddOrderForm(context, state),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(child: buildOrderListSection(context, state)),
                  ],
                ),
              );
      }),
      bottomNavigationBar: BlocBuilder<AddOrderBloc, AddOrderState>(
        builder: (context, state) {
          return buildSignSection(context, state);
        },
      ),
    );
  }

  Container buildSignSection(BuildContext context, AddOrderState state) {
    return Container(
      color: Colors.grey.shade400,
      child: Row(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(PathConstants.signaturePage).then((value) {
                  if (value != null) {
                    context
                        .read<AddOrderBloc>()
                        .add(SignatureImageAdded(bytes: (value as Uint8List)));
                  }
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Text(
                  "Tap to sign",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              context.pushNamed(PathConstants.signaturePage).then((value) {
                if (value != null) {
                  context
                      .read<AddOrderBloc>()
                      .add(SignatureImageAdded(bytes: (value as Uint8List)));
                }
              });
            },
            child: SizedBox(
              height: 100,
              child: state.bytes != null
                  ? Image.memory(
                      state.bytes!,
                      height: 100,
                      width: 200,
                    )
                  : Container(
                      height: 100,
                      width: 200,
                      color: Colors.white,
                    ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {},
              child: const Icon(
                Icons.check,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildOrderListSection(BuildContext context, AddOrderState state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.grey.shade800,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "Qty",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ),
        Expanded(
          child: state.unitsAdded.length == 0
              ? Center(child: const Text("No Products Added."))
              : ListView.builder(
                  controller: _scrollController,
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
                    text: "View Order Details",
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Form buildAddOrderForm(BuildContext context, AddOrderState state) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SelectCustomerDropDown(state: state),
            const SizedBox(
              height: 8,
            ),
            SelectCategoryDropDown(state: state),
            const SizedBox(
              height: 8,
            ),
            SelectProductDropDown(state: state),
            const SizedBox(
              height: 8,
            ),
            QuantityField(quantityController: quantityController),
            const SizedBox(
              height: 16,
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
                buildSubtractMethod(),
                buildRemoveButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRemoveButton() {
    return CommonButton(
      onPressed: () {
        // toggle the visibility of remove icon
        setState(() {
          showRemove = !showRemove;
        });
      },
      text: "Rem",
    );
  }

  Widget buildSubtractMethod() {
    return CommonButton(
      onPressed: () {
        // toggle the visibility of subtract icon
        setState(() {
          showSubtract = !showSubtract;
        });
      },
      text: "Sub",
    );
  }
}

class SmallIcon extends StatelessWidget {
  const SmallIcon({super.key, required this.onTap, required this.iconData});

  final Function onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(6)),
        child: Icon(
          iconData,
          size: 16,
        ),
      ),
    );
  }
}

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
          // add unit event
          context
              .read<AddOrderBloc>()
              .add(UnitAdded(quantity: quantityController.text));
          // scrollController.animateTo(
          //   scrollController.position.maxScrollExtent,
          //   duration: const Duration(milliseconds: 100),
          //   curve: Curves.fastOutSlowIn,
          // );
        }
      },
      text: "Add",
    );
  }
}

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.onPressed, required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        minimumSize: Size(
          MediaQuery.of(context).size.width * 0.25,
          48,
        ),
      ),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff112A46),
          fontSize: 14,
        ),
      ),
    );
  }
}

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
      controller: quantityController,
      decoration: const InputDecoration(
        label: Text(
          "Select Qty",
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Quantity cannot be empty";
        } else if (int.tryParse(value) == null) {
          return "Please enter whole number as quantity.";
        }
      },
    );
  }
}

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
      decoration: const InputDecoration(
        label: Text("Select Product"),
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
          print("value: ${state.products}");
          context.read<AddOrderBloc>().add(ProductSelected(
              selectedProduct:
                  state.products.singleWhere((pro) => pro.name == value)));
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a product.";
        }
        return null;
      },
    );
  }
}

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
      decoration: const InputDecoration(
        label: Text("Select Category"),
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
          return "Please select a category.";
        }
        return null;
      },
    );
  }
}

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
      decoration: const InputDecoration(
        label: Text("Select Customer"),
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
          return "Please select a customer.";
        }
        return null;
      },
    );
  }
}
