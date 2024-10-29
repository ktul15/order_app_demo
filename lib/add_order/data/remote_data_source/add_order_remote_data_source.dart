import 'package:dio/dio.dart';

class AddOrderRemoteDataSource {
  AddOrderRemoteDataSource(Dio? dio) {
    _dio = dio ??
        Dio(
          BaseOptions(
            baseUrl: "https://foodmanandws.isni.co/AndroidService.svc/",
          ),
        );
  }

  late Dio _dio;

  Future<List<String>> getCustomers() async {
    final customers = ["Customer 1", "Customer 2", "Customer 3"];
    return customers;
  }
}
