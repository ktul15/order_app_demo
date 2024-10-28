import 'package:equatable/equatable.dart';

sealed class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object?> get props => [];
}

class AddOrOrderInProgress extends AddOrderState {
  const AddOrOrderInProgress();

  @override
  List<Object?> get props => super.props;
}

class AddOrOrderSuccess extends AddOrderState {
  const AddOrOrderSuccess();

  @override
  List<Object?> get props => [];
}
