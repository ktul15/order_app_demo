import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

import '../bloc/add_order_event.dart';

class AddOrderView extends StatelessWidget {
  AddOrderView({super.key});

  final formKey = GlobalKey<FormState>();
  final quantityController = TextEditingController();

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
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            DropdownButtonFormField<String>(
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * 0.5,
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
                                  context.read<AddOrderBloc>().add(
                                      CustomerSelected(
                                          selectedCustomer:
                                              state.customers.singleWhere(
                                                  (pro) => pro.name == value)));
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select a customer.";
                                }
                                return null;
                              },
                            ),
                            DropdownButtonFormField<String>(
                              // width: MediaQuery.of(context).size.width,
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * 0.5,
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
                                  context.read<AddOrderBloc>().add(
                                      CategorySelected(
                                          selectedCategory:
                                              state.categories.singleWhere(
                                                  (cat) => cat == value)));
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select a category.";
                                }
                                return null;
                              },
                            ),
                            DropdownButtonFormField<String>(
                              // width: MediaQuery.of(context).size.width,
                              menuMaxHeight:
                                  MediaQuery.of(context).size.height * 0.5,
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
                                  print(value);
                                  context.read<AddOrderBloc>().add(
                                      ProductSelected(
                                          selectedProduct: state.products
                                              .singleWhere(
                                                  (pro) => pro.name == value)));
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select a product.";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
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
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState?.validate() ==
                                        true) {
                                      // add unit event
                                      context.read<AddOrderBloc>().add(
                                          UnitAdded(
                                              quantity:
                                                  quantityController.text));
                                    }
                                  },
                                  child: const Text(
                                    "Add",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.grey.shade800,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "Qty",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: state.unitsAdded.length,
                            itemBuilder: (context, index) {
                              final name = state.unitsAdded[index].product.name;
                              final quantity = state.unitsAdded[index].quantity;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(name ?? ""),
                                    Text(quantity.toString()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
      }),
    );
  }
}
