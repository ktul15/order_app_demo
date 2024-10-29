import 'package:equatable/equatable.dart';

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
  const AddOrderSuccess({required this.customers});

  final List<GetCustomersResult> customers;

  @override
  List<Object?> get props => [customers];
}

class AddOrderFailed extends AddOrderState {
  const AddOrderFailed({required this.message, required this.customers});

  final List<GetCustomersResult> customers;
  final String message;

  @override
  List<Object?> get props => [customers, message];
}
