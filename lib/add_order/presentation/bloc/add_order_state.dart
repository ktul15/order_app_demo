import 'package:equatable/equatable.dart';

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

  final List<String> customers;

  @override
  List<Object?> get props => [customers];
}
