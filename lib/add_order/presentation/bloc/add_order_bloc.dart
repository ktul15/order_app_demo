import 'package:bloc/bloc.dart';
import 'package:order_app_demo/add_order/domain/repository/add_order_repository.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_event.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  AddOrderBloc(super.initialState, AddOrderRepository addOrderRepository) {
    _addOrderRepository = addOrderRepository;
    on<AddOrderGetCustomersLoaded>(_onAddOrderGetCustomersLoaded);
    on<AddOrderGetCategoriesLoaded>(_onAddOrderGetCategoriesLoaded);
    add(AddOrderGetCustomersLoaded());
  }

  late AddOrderRepository _addOrderRepository;

  void _onAddOrderGetCustomersLoaded(
      AddOrderGetCustomersLoaded event, Emitter emit) async {
    final prevState =
        state.runtimeType == AddOrderSuccess ? state as AddOrderSuccess : null;
    emit(const AddOrderInProgress());

    final custRes = await _addOrderRepository.getCustomers();
    custRes.fold((l) async {
      emit(
        AddOrderSuccess(
          customers: l,
          categories: prevState != null ? prevState.categories : [],
        ),
      );
      add(AddOrderGetCategoriesLoaded());
    }, (r) {
      emit(AddOrderFailed(message: r.toString()));
    });
  }

  void _onAddOrderGetCategoriesLoaded(
      AddOrderGetCategoriesLoaded event, Emitter emit) async {
    final prevState =
        state.runtimeType == AddOrderSuccess ? state as AddOrderSuccess : null;
    print("prevState: ${prevState.runtimeType}");
    emit(const AddOrderInProgress());

    final catRes = await _addOrderRepository.getCategories();
    catRes.fold((l) {
      emit(AddOrderSuccess(
        categories: l,
        customers: prevState != null ? prevState.customers : [],
      ));
    }, (r) {
      emit(AddOrderFailed(message: r.toString()));
    });
  }
}
