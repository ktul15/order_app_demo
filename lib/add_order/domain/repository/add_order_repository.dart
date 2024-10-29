import 'package:order_app_demo/add_order/data/remote_data_source/add_order_remote_data_source.dart';

class AddOrderRepository {
  AddOrderRepository(AddOrderRemoteDataSource addOrderRemoteDataSource) {
    _addOrderRemoteDataSource = addOrderRemoteDataSource;
  }

  late AddOrderRemoteDataSource _addOrderRemoteDataSource;

  Future<List<String>> getCustomers() async {
    final customers = await _addOrderRemoteDataSource.getCustomers();
    return customers;
  }
}
