import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:order_app_demo/add_order/data/models/request/get_customers_request.dart';
import 'package:order_app_demo/add_order/data/models/response/get_customer_response.dart';
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
}
