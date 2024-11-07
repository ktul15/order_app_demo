import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';
import 'package:order_app_demo/utils/constants.dart';
import 'package:order_app_demo/utils/database.dart';

import '../models/response/get_categories_response.dart';
import '../models/response/get_customer_response.dart';

@lazySingleton
class AddOrderLocalDataSource {
  AddOrderLocalDataSource();

  final database = LocalDatabase.database;

  Future<void> insertCategories(
      GetCategoriesResponse getCategoryResponse) async {
    try {
      getCategoryResponse.getCategoriesResult?.forEach((cat) async {
        await database?.insert(
          Constants.categories_db_table,
          {"name": cat},
        );
      });
    } on Exception catch (e) {
      debugPrint("e insertCategories: $e");
    }
  }

  Future<List<String>> getCategories() async {
    print("getting categories from local db");
    List<String> categories = [];
    try {
      final res = await database?.query(Constants.categories_db_table);
      if (res != null) {
        for (var catMap in res) {
          categories.add(catMap["name"].toString());
        }
      }
      return categories;
    } on Exception catch (e) {
      return categories;
    }
  }

  Future<void> insertCustomers(List<GetCustomersResult> customersList) async {
    try {
      customersList.forEach((customer) async {
        await database?.insert(
          Constants.customers_db_table,
          customer.toJson(),
        );
      });
    } on Exception catch (e) {
      debugPrint("e insertCustomers: $e");
    }
  }

  Future<List<GetCustomersResult>> getCustomers() async {
    print("getting customers from local db");
    List<GetCustomersResult> customers = [];

    try {
      final res = await database?.query(Constants.customers_db_table);
      if (res != null && res.isNotEmpty) {
        res.forEach((custMap) {
          customers.add(
            GetCustomersResult.fromJson(
              custMap,
            ),
          );
        });
      }
      return customers;
    } on Exception catch (e) {
      return customers;
    }
  }

  Future<void> insertProducts(List<GetProductsResult> productList) async {
    try {
      productList.forEach((product) async {
        await database?.insert(
          Constants.products_db_table,
          product.toJson(),
        );
      });
    } on Exception catch (e) {
      debugPrint("e insertProducts: $e");
    }
  }

  Future<List<GetProductsResult>> getProducts() async {
    print("getting products from local db");
    List<GetProductsResult> products = [];
    try {
      final res = await database?.query(Constants.products_db_table);
      if (res != null) {
        for (var prodMap in res) {
          products.add(
            GetProductsResult.fromJson(
              prodMap,
            ),
          );
        }
      }
      return products;
    } on Exception catch (e) {
      print("e: $e");
      return products;
    }
  }
}
