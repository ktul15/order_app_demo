import 'package:order_app_demo/add_order/data/models/response/get_customer_response.dart';
import 'package:order_app_demo/add_order/data/models/response/get_products_response.dart';

abstract class AddOrderEvent {}

class AddOrderGetCustomersLoaded extends AddOrderEvent {
  AddOrderGetCustomersLoaded();
}

class AddOrderGetCategoriesLoaded extends AddOrderEvent {
  AddOrderGetCategoriesLoaded();
}

class AddOrderGetProductsLoaded extends AddOrderEvent {
  AddOrderGetProductsLoaded();
}

class CustomerSelected extends AddOrderEvent {
  CustomerSelected({required this.selectedCustomer});
  final GetCustomersResult selectedCustomer;
}

class CategorySelected extends AddOrderEvent {
  CategorySelected({required this.selectedCategory});
  final String selectedCategory;
}

class ProductSelected extends AddOrderEvent {
  ProductSelected({required this.selectedProduct});
  final GetProductsResult selectedProduct;
}

class QuantityChanged extends AddOrderEvent {
  QuantityChanged({required this.quantity});
  final String quantity;
}

class UnitAdded extends AddOrderEvent {
  UnitAdded({required this.quantity});
  // final GetCustomersResult customer;
  // final GetProductsResult product;
  // final String category;
  final String quantity;
}

class QuantitySubtracted extends AddOrderEvent {
  QuantitySubtracted({required this.index});
  final int index;
}

class UnitRemoved extends AddOrderEvent {
  UnitRemoved({required this.index});
  final int index;
}
