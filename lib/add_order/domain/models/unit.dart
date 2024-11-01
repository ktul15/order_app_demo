import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_app_demo/add_order/data/models/response/get_customer_response.dart';
import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';

part 'unit.freezed.dart';

@freezed
class ProductUnit with _$ProductUnit {
  const factory ProductUnit({
    required GetCustomersResult customer,
    required GetProductsResult product,
    required String category,
    required int quantity,
  }) = _ProductUnit;
}
