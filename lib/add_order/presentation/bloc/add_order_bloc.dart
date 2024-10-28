import 'package:bloc/bloc.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_event.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  AddOrderBloc(super.initialState) {
    on<AddOrderLoaded>(_onAddOrderLoaded);
    add(AddOrderLoaded());
  }

  void _onAddOrderLoaded(AddOrderLoaded event, Emitter emit) async {
    emit(const AddOrOrderInProgress());
  }
}
