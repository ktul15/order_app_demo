import 'package:fpdart/fpdart.dart';
import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';
import 'package:order_app_demo/add_order/data/remote_data_source/add_order_remote_data_source.dart';

import '../../data/models/response/get_customer_response.dart';

class AddOrderRepository {
  AddOrderRepository(AddOrderRemoteDataSource addOrderRemoteDataSource) {
    _addOrderRemoteDataSource = addOrderRemoteDataSource;
  }

  late AddOrderRemoteDataSource _addOrderRemoteDataSource;

  Future<Either<List<GetCustomersResult>, Exception>> getCustomers() async {
    final res = await _addOrderRemoteDataSource.getCustomers();

    return res.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }

  Future<Either<List<String>, Exception>> getCategories() async {
    final res = await _addOrderRemoteDataSource.getCategories();

    return res.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }

  Future<Either<List<GetProductsResult>, Exception>> getProducts() async {
    final res = await _addOrderRemoteDataSource.getProducts();

    return res.fold((l) {
      return left(l);
    }, (r) {
      return right(r);
    });
  }
}
