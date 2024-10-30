import 'package:equatable/equatable.dart';
import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';

import '../../data/models/response/get_customer_response.dart';

sealed class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object?> get props => [];
}

class AddOrderInProgress extends AddOrderState {
  const AddOrderInProgress();

  @override
  List<Object?> get props => super.props;
}

class AddOrderSuccess extends AddOrderState {
  const AddOrderSuccess({
    this.customers = const [],
    this.products = const [],
    this.categories = const [],
  });

  final List<GetCustomersResult> customers;
  final List<GetProductsResult> products;
  final List<String> categories;

  @override
  List<Object?> get props => [customers, categories, products];
}

class AddOrderFailed extends AddOrderState {
  const AddOrderFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
