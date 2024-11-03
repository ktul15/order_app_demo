import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:order_app_demo/add_order/domain/models/unit.dart';
import 'package:order_app_demo/add_order/domain/repository/add_order_repository.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_event.dart';
import 'package:order_app_demo/add_order/presentation/bloc/add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  AddOrderBloc(super.initialState, AddOrderRepository addOrderRepository) {
    _addOrderRepository = addOrderRepository;
    on<AddOrderGetCustomersLoaded>(_onAddOrderGetCustomersLoaded);
    on<AddOrderGetCategoriesLoaded>(_onAddOrderGetCategoriesLoaded);
    on<AddOrderGetProductsLoaded>(_onAddOrderGetProductsLoaded);
    on<CustomerSelected>(_onCustomerSelected);
    on<CategorySelected>(_onCategorySelected);
    on<ProductSelected>(_onProductSelected);
    on<QuantityChanged>(_onQuantityChanged);
    on<UnitAdded>(_onUnitAdded);
    on<QuantitySubtracted>(_onQuantitySubtracted);
    on<UnitRemoved>(_onUnitRemoved);
    add(AddOrderGetCustomersLoaded());
  }

  late AddOrderRepository _addOrderRepository;

  void _onAddOrderGetCustomersLoaded(
      AddOrderGetCustomersLoaded event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    final custRes = await _addOrderRepository.getCustomers();
    custRes.fold((l) async {
      print("c: ${l.first.name}");
      emit(state.copyWith(
        isLoading: false,
        customers: l,
      ));
      add(AddOrderGetCategoriesLoaded());
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        error: r.toString(),
      ));
    });
  }

  void _onAddOrderGetCategoriesLoaded(
      AddOrderGetCategoriesLoaded event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    final catRes = await _addOrderRepository.getCategories();
    catRes.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        categories: l,
      ));
      add(AddOrderGetProductsLoaded());
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        error: r.toString(),
      ));
    });
  }

  void _onAddOrderGetProductsLoaded(
      AddOrderGetProductsLoaded event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    final prodRes = await _addOrderRepository.getProducts();
    prodRes.fold((l) {
      emit(state.copyWith(
        isLoading: false,
        products: l,
      ));
    }, (r) {
      emit(state.copyWith(
        isLoading: false,
        error: r.toString(),
      ));
    });
  }

  void _onCustomerSelected(CustomerSelected event, Emitter emit) async {
    emit(
      state.copyWith(
        selectedCustomer: event.selectedCustomer,
      ),
    );
  }

  void _onCategorySelected(CategorySelected event, Emitter emit) async {
    emit(state.copyWith(selectedCategory: event.selectedCategory));
  }

  void _onProductSelected(ProductSelected event, Emitter emit) async {
    emit(state.copyWith(selectedProduct: event.selectedProduct));
  }

  void _onQuantityChanged(QuantityChanged event, Emitter emit) async {
    emit(
      state.copyWith(
        quantity: int.tryParse(event.quantity) ?? 0,
      ),
    );
  }

  void _onUnitAdded(UnitAdded event, Emitter emit) async {
    emit(state.copyWith(
      isLoading: true,
      error: "",
    ));

    int? quantity = int.tryParse(event.quantity);

    if (state.selectedCustomer == null ||
        state.selectedProduct == null ||
        state.selectedCategory == null ||
        quantity == null ||
        quantity == 0) {
      emit(
        state.copyWith(
          isLoading: false,
          error: "Unit cannot be added.",
        ),
      );
      return;
    }

    final newUnit = ProductUnit(
      index: state.unitsAdded.length,
      customer: state.selectedCustomer!,
      product: state.selectedProduct!,
      category: state.selectedCategory!,
      quantity: quantity,
    );

    // check if unit already exist.
    bool isAlreadyExists = state.unitsAdded
        .filter(
          (prod) =>
              prod.product.name == state.selectedProduct?.name &&
              prod.category == state.selectedCategory &&
              prod.customer == state.selectedCustomer,
        )
        .isNotEmpty;

    print("isAlreadyExists: $isAlreadyExists");

    if (isAlreadyExists) {
      final updatedUnits = state.unitsAdded.map((prod) {
        if (prod.product.name == state.selectedProduct?.name &&
            prod.category == state.selectedCategory &&
            prod.customer == state.selectedCustomer) {
          return ProductUnit(
            index: prod.index,
            customer: prod.customer,
            product: prod.product,
            category: prod.category,
            quantity: prod.quantity + quantity,
          );
        } else {
          return prod;
        }
      }).toList();

      print(updatedUnits.toString());

      emit(state.copyWith(unitsAdded: updatedUnits, isLoading: false));
    } else {
      final unitsAdded = [...state.unitsAdded, newUnit];

      emit(state.copyWith(unitsAdded: unitsAdded, isLoading: false));
    }
  }

  void _onQuantitySubtracted(QuantitySubtracted event, Emitter emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    if (state.unitsAdded[event.index].quantity == 1) {
      List<ProductUnit> updatedUnits = [];
      state.unitsAdded.asMap().filterWithIndex((unit, index) {
        if (index != event.index) {
          updatedUnits.add(unit);
          return true;
        }
        return false;
      });
      emit(state.copyWith(unitsAdded: updatedUnits, isLoading: false));
    } else {
      final updatedUnits = state.unitsAdded.mapWithIndex((unit, index) {
        if (index == event.index) {
          return unit.copyWith(quantity: unit.quantity - 1);
        } else {
          return unit;
        }
      }).toList();

      emit(state.copyWith(
        unitsAdded: updatedUnits,
        isLoading: false,
      ));
    }
  }

  void _onUnitRemoved(UnitRemoved event, Emitter emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    List<ProductUnit> updatedUnits = [];
    state.unitsAdded.asMap().filterWithIndex((unit, index) {
      if (index != event.index) {
        updatedUnits.add(unit);
        return true;
      }
      return false;
    });
    emit(state.copyWith(unitsAdded: updatedUnits, isLoading: false));
  }
}
