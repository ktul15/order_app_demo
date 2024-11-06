import 'package:fpdart/fpdart.dart';
import 'package:order_app_demo/add_order/data/local_data_source/add_order_local_data_source.dart';
import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';
import 'package:order_app_demo/add_order/data/remote_data_source/add_order_remote_data_source.dart';

import '../../data/models/response/get_customer_response.dart';

class AddOrderRepository {
  AddOrderRepository(
    AddOrderRemoteDataSource addOrderRemoteDataSource,
    AddOrderLocalDataSource addOrderLocalDataSource,
  ) {
    _addOrderRemoteDataSource = addOrderRemoteDataSource;
    _addOrderLocalDataSource = addOrderLocalDataSource;
  }

  late AddOrderRemoteDataSource _addOrderRemoteDataSource;
  late AddOrderLocalDataSource _addOrderLocalDataSource;

  Future<Either<List<GetCustomersResult>, Exception>> getCustomers() async {
    final customerListFromLocalDB =
        await _addOrderLocalDataSource.getCustomers();
    if (customerListFromLocalDB.isEmpty) {
      final res = await _addOrderRemoteDataSource.getCustomers();

      return res.fold((l) async {
        await _addOrderLocalDataSource.insertCustomers(l);
        return left(l);
      }, (r) {
        return right(r);
      });
    } else {
      return left(customerListFromLocalDB);
    }
  }

  Future<Either<List<String>, Exception>> getCategories() async {
    final categories = await _addOrderLocalDataSource.getCategories();
    if (categories.isEmpty) {
      final res = await _addOrderRemoteDataSource.getCategories();

      return res.fold((l) async {
        await _addOrderLocalDataSource.insertCategories(l);
        return left(l.getCategoriesResult ?? []);
      }, (r) {
        return right(r);
      });
    } else {
      return left(categories);
    }
  }

  Future<Either<List<GetProductsResult>, Exception>> getProducts() async {
    final productsListFromLocalDB =
        await _addOrderLocalDataSource.getProducts();
    print("productsListFromLocalDB: ${productsListFromLocalDB.length}");
    if (productsListFromLocalDB.isEmpty) {
      final res = await _addOrderRemoteDataSource.getProducts();

      return res.fold((l) async {
        await _addOrderLocalDataSource.insertProducts(l);
        return left(l);
      }, (r) {
        return right(r);
      });
    } else {
      return left(productsListFromLocalDB);
    }
  }
}
