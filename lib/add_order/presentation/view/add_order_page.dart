import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_app_demo/add_order/data/local_data_source/add_order_local_data_source.dart';
import 'package:order_app_demo/add_order/data/remote_data_source/add_order_remote_data_source.dart';
import 'package:order_app_demo/add_order/domain/repository/add_order_repository.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';
import 'package:order_app_demo/add_order/presentation/view/add_order_view.dart';

class AddOrderPage extends StatelessWidget {
  const AddOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddOrderBloc>(
      create: (_) => AddOrderBloc(
          const AddOrderState(
            "",
            isLoading: true,
          ),
          AddOrderRepository(
            AddOrderRemoteDataSource(),
            const AddOrderLocalDataSource(),
          )),
      child: Builder(builder: (context) {
        return AddOrderView();
      }),
    );
  }
}
