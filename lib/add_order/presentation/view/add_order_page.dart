import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';
import 'package:order_app_demo/add_order/presentation/view/add_order_view.dart';

class AddOrderPage extends StatelessWidget {
  const AddOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddOrderBloc>(
      create: (_) => AddOrderBloc(AddOrderState()),
      child: Builder(builder: (context) {
        return const AddOrderView();
      }),
    );
  }
}
