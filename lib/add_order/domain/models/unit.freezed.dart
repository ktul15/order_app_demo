// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductUnit {
  int get index => throw _privateConstructorUsedError;
  GetCustomersResult get customer => throw _privateConstructorUsedError;
  GetProductsResult get product => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Create a copy of ProductUnit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductUnitCopyWith<ProductUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductUnitCopyWith<$Res> {
  factory $ProductUnitCopyWith(
          ProductUnit value, $Res Function(ProductUnit) then) =
      _$ProductUnitCopyWithImpl<$Res, ProductUnit>;
  @useResult
  $Res call(
      {int index,
      GetCustomersResult customer,
      GetProductsResult product,
      String category,
      int quantity});
}

/// @nodoc
class _$ProductUnitCopyWithImpl<$Res, $Val extends ProductUnit>
    implements $ProductUnitCopyWith<$Res> {
  _$ProductUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductUnit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? customer = null,
    Object? product = null,
    Object? category = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as GetCustomersResult,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as GetProductsResult,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductUnitImplCopyWith<$Res>
    implements $ProductUnitCopyWith<$Res> {
  factory _$$ProductUnitImplCopyWith(
          _$ProductUnitImpl value, $Res Function(_$ProductUnitImpl) then) =
      __$$ProductUnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      GetCustomersResult customer,
      GetProductsResult product,
      String category,
      int quantity});
}

/// @nodoc
class __$$ProductUnitImplCopyWithImpl<$Res>
    extends _$ProductUnitCopyWithImpl<$Res, _$ProductUnitImpl>
    implements _$$ProductUnitImplCopyWith<$Res> {
  __$$ProductUnitImplCopyWithImpl(
      _$ProductUnitImpl _value, $Res Function(_$ProductUnitImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductUnit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? customer = null,
    Object? product = null,
    Object? category = null,
    Object? quantity = null,
  }) {
    return _then(_$ProductUnitImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as GetCustomersResult,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as GetProductsResult,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProductUnitImpl implements _ProductUnit {
  const _$ProductUnitImpl(
      {required this.index,
      required this.customer,
      required this.product,
      required this.category,
      required this.quantity});

  @override
  final int index;
  @override
  final GetCustomersResult customer;
  @override
  final GetProductsResult product;
  @override
  final String category;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ProductUnit(index: $index, customer: $customer, product: $product, category: $category, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductUnitImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, index, customer, product, category, quantity);

  /// Create a copy of ProductUnit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductUnitImplCopyWith<_$ProductUnitImpl> get copyWith =>
      __$$ProductUnitImplCopyWithImpl<_$ProductUnitImpl>(this, _$identity);
}

abstract class _ProductUnit implements ProductUnit {
  const factory _ProductUnit(
      {required final int index,
      required final GetCustomersResult customer,
      required final GetProductsResult product,
      required final String category,
      required final int quantity}) = _$ProductUnitImpl;

  @override
  int get index;
  @override
  GetCustomersResult get customer;
  @override
  GetProductsResult get product;
  @override
  String get category;
  @override
  int get quantity;

  /// Create a copy of ProductUnit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductUnitImplCopyWith<_$ProductUnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
