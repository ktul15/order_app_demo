import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:order_app_demo/add_order/data/models/request/get_categories.dart'
    as categories_request;
import 'package:order_app_demo/add_order/data/models/request/get_customers_request.dart';
import 'package:order_app_demo/add_order/data/models/request/get_products_request.dart'
    as product_request;
import 'package:order_app_demo/add_order/data/models/response/get_categories_response.dart';
import 'package:order_app_demo/add_order/data/models/response/get_customer_response.dart';
import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';
import 'package:order_app_demo/utils/app_config.dart';
import 'package:order_app_demo/utils/app_urls.dart';

class AddOrderRemoteDataSource {
  AddOrderRemoteDataSource() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.orderApiUrl,
      ),
    );
  }

  Dio? _dio;

  Future<Either<List<GetCustomersResult>, Exception>> getCustomers() async {
    print("getting customers from network");
    GetCustomerRequest getCustomerRequest = GetCustomerRequest(
      user: User(
        userName: "v",
        password: "v",
        deviceId: "355622080315528",
        active: true,
        appType: "Android",
        firstName: "Vinay",
        id: 3,
        lastName: "Patel",
        orderCode: "VIE",
        orderCount: 1,
        orderPredictionCount: 1,
        role: "Driver",
      ),
      syncDate: "/Date(536436000-600)/",
      pageIndex: 0,
      appVersionNo: "1.0",
      deviceDate: "/Date(536436000-600)/",
    );

    try {
      final res = await _dio?.post(AppUrl.getCustomers,
          data: getCustomerRequest.toJson());
      print("res: $res");
      print("res: ${res?.statusCode}");

      if (res?.statusCode == 200 && res?.data != null) {
        GetCustomerResponse getCustomerResponse =
            GetCustomerResponse.fromJson(res?.data);

        print(
            "getCustomerResponse.getCustomersResult: ${getCustomerResponse.getCustomersResult}");

        return left(getCustomerResponse.getCustomersResult ?? []);
      } else {
        throw Exception("Something went wrong.");
      }
    } on DioException catch (e) {
      print("fsadf: $e");

      if (e.type == DioExceptionType.connectionError &&
          e.error is SocketException) {
        return right(Exception("Please check your internet connection."));
      }
      return right(Exception(e.message));
    } on Exception {
      return right(
        Exception(
          "Something went wrong.",
        ),
      );
    }
  }

  Future<Either<GetCategoriesResponse, Exception>> getCategories() async {
    print("getting categories from network");

    categories_request.GetCategoriesRequest getCategoriesRequest =
        categories_request.GetCategoriesRequest(
      appVersionNo: "20240715.14",
      deviceDate: "/Date(1721035961915+0530)/",
      user: categories_request.User(
        userName: "v",
        password: "v",
        deviceId: "7f2226495640ecb1",
        active: true,
        appType: "Mobile",
        firstName: "Vinay",
        id: 3,
        isResetSync: false,
        lastName: "Emu",
        orderCode: "VIE",
        orderCount: 98,
        orderPredictionCount: 19,
        role: "Driver",
      ),
    );

    try {
      final res = await _dio?.post(
        AppUrl.getCategories,
        data: getCategoriesRequest.toJson(),
      );

      if (res?.statusCode == 200 && res?.data != null) {
        GetCategoriesResponse getCategoriesResponse =
            GetCategoriesResponse.fromJson(res?.data);

        return left(getCategoriesResponse);
      } else {
        throw Exception("Something went wrong.");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError &&
          e.error is SocketException) {
        return right(Exception("Please check your internet connection."));
      }
      return right(Exception(e.message));
    } on Exception {
      return right(
        Exception(
          "Something went wrong.",
        ),
      );
    }
  }

  Future<Either<List<GetProductsResult>, Exception>> getProducts() async {
    print("getting products from network");
    product_request.GetProductsRequest getProductsRequest =
        product_request.GetProductsRequest(
      syncDate: "/Date(536436000-600)/",
      pageIndex: 0,
      appVersionNo: "1.0",
      deviceDate: "/Date(1720768210-600)/",
      user: product_request.User(
        userName: "v",
        password: "v",
        deviceId: "7f2226495640ecb1",
        active: true,
        appType: "Mobile",
        firstName: "Vinay",
        id: 3,
        isResetSync: false,
        lastName: "Emu",
        orderCode: "VIE",
        orderCount: 98,
        orderPredictionCount: 19,
        role: "Driver",
      ),
    );

    try {
      final res = await _dio?.post(
        AppUrl.getProducts,
        data: getProductsRequest.toJson(),
      );
      print("res: $res");
      print("res: ${res?.statusCode}");

      if (res?.statusCode == 200 && res?.data != null) {
        GetProductsResponse getProductsResponse =
            GetProductsResponse.fromJson(res?.data);

        return left(getProductsResponse.getProductsResult ?? []);
      } else {
        throw Exception("Something went wrong.");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError &&
          e.error is SocketException) {
        return right(Exception("Please check your internet connection."));
      }
      return right(Exception(e.message));
    } on Exception {
      return right(
        Exception(
          "Something went wrong.",
        ),
      );
    }
  }
}
