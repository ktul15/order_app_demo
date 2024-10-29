import 'package:bloc/bloc.dart';
import 'package:order_app_demo/add_order/domain/repository/add_order_repository.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_event.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  AddOrderBloc(super.initialState, AddOrderRepository addOrderRepository) {
    _addOrderRepository = addOrderRepository;
    on<AddOrderLoaded>(_onAddOrderLoaded);
    add(AddOrderLoaded());
  }

  late AddOrderRepository _addOrderRepository;

  void _onAddOrderLoaded(AddOrderLoaded event, Emitter emit) async {
    emit(const AddOrderInProgress());

    final customers = await _addOrderRepository.getCustomers();

    emit(
      AddOrderSuccess(
        customers: customers,
      ),
    );
  }
}
