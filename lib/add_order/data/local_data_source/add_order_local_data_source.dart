import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';
import 'package:order_app_demo/utils/constants.dart';

import '../../../main.dart';
import '../models/response/get_categories_response.dart';
import '../models/response/get_customer_response.dart';

class AddOrderLocalDataSource {
  const AddOrderLocalDataSource();

  Future<void> insertCategories(
      GetCategoriesResponse getCategoryResponse) async {
    getCategoryResponse.getCategoriesResult?.forEach((cat) async {
      await database.insert(
        Constants.categories_db_table,
        {"name": cat},
      );
    });
  }

  Future<List<String>> getCategories() async {
    print("getting categories from local db");
    final res = await database.query(Constants.categories_db_table);
    List<String> categories = [];
    res.forEach((catMap) {
      categories.add(catMap["name"].toString());
    });
    return categories;
  }

  Future<void> insertCustomers(List<GetCustomersResult> customersList) async {
    customersList.forEach((customer) async {
      await database.insert(
        Constants.customers_db_table,
        customer.toJson(),
      );
    });
  }

  Future<List<GetCustomersResult>> getCustomers() async {
    print("getting customers from local db");
    final res = await database.query(Constants.customers_db_table);
    List<GetCustomersResult> customers = [];
    res.forEach((custMap) {
      customers.add(
        GetCustomersResult.fromJson(
          custMap,
        ),
      );
    });
    return customers;
  }

  Future<void> insertProducts(List<GetProductsResult> productList) async {
    productList.forEach((product) async {
      await database.insert(
        Constants.products_db_table,
        product.toJson(),
      );
    });
  }

  Future<List<GetProductsResult>> getProducts() async {
    print("getting products from local db");
    final res = await database.query(Constants.products_db_table);
    List<GetProductsResult> products = [];
    res.forEach((prodMap) {
      products.add(
        GetProductsResult.fromJson(
          prodMap,
        ),
      );
    });
    return products;
  }
}
