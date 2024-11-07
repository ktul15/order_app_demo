import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:order_app_demo/utils/app_config.dart';

@lazySingleton
class DioClient {
  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.orderApiUrl,
      ),
    );
  }

  late Dio dio;
}
