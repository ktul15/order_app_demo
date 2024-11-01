import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/response/get_customer_response.dart';
import '../../data/models/response/get_products_response.dart';
import '../../domain/models/unit.dart';

part 'add_order_state.freezed.dart';

@freezed
class AddOrderState with _$AddOrderState {
  const factory AddOrderState(
    String error, {
    required bool isLoading,
    @Default([]) List<GetCustomersResult> customers,
    @Default([]) List<GetProductsResult> products,
    @Default([]) List<String> categories,
    String? selectedCategory,
    GetCustomersResult? selectedCustomer,
    GetProductsResult? selectedProduct,
    @Default(0) int quantity,
    @Default([]) List<ProductUnit> unitsAdded,
  }) = _AddOrderState;

  // final bool isLoading;
  // final String? error;
  // final List<GetCustomersResult> customers;
  // final List<GetProductsResult> products;
  // final List<String> categories;
  // final GetCustomersResult? selectedCustomer;
  // final GetProductsResult? selectedProduct;
  // final String? selectedCategory;
}
//
// class AddOrderFailed extends AddOrderState {
//   const AddOrderFailed({required this.message});
//
//   final String message;
//
//   @override
//   List<Object?> get props => [message];
// }
