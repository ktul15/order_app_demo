import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app_demo/add_order/domain/repository/add_order_repository.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';
import 'package:order_app_demo/add_order/presentation/view/add_order_view.dart';

import '../../../utils/di_initializer.dart';

class AddOrderPage extends StatelessWidget {
  const AddOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddOrderBloc>(
      create: (_) => AddOrderBloc(
        const AddOrderState(
          error: "",
          isLoading: true,
        ),
        getIt<AddOrderRepository>(),
      ),
      child: Builder(builder: (context) {
        return AddOrderView();
      }),
    );
  }
}
