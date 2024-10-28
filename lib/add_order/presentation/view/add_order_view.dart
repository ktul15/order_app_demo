import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Order"),
      ),
      body: BlocBuilder<AddOrderBloc, AddOrderState>(
        builder: (context, state) {
          return const Center(
            child: Text("Add Order"),
          );
        },
      ),
    );
  }
}
