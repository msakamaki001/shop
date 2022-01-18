// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shop_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShopStateTearOff {
  const _$ShopStateTearOff();

  _ShopState call(
      {Customer? customer,
      List<Category?>? categories = const [],
      Map<int?, List<Item?>?>? items = const {},
      Cart? cart,
      List<Item?>? cartItems,
      Timer? timer}) {
    return _ShopState(
      customer: customer,
      categories: categories,
      items: items,
      cart: cart,
      cartItems: cartItems,
      timer: timer,
    );
  }
}

/// @nodoc
const $ShopState = _$ShopStateTearOff();

/// @nodoc
mixin _$ShopState {
  Customer? get customer => throw _privateConstructorUsedError;
  List<Category?>? get categories => throw _privateConstructorUsedError;
  Map<int?, List<Item?>?>? get items => throw _privateConstructorUsedError;
  Cart? get cart => throw _privateConstructorUsedError;
  List<Item?>? get cartItems => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopStateCopyWith<ShopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopStateCopyWith<$Res> {
  factory $ShopStateCopyWith(ShopState value, $Res Function(ShopState) then) =
      _$ShopStateCopyWithImpl<$Res>;
  $Res call(
      {Customer? customer,
      List<Category?>? categories,
      Map<int?, List<Item?>?>? items,
      Cart? cart,
      List<Item?>? cartItems,
      Timer? timer});

  $CustomerCopyWith<$Res>? get customer;
  $CartCopyWith<$Res>? get cart;
}

/// @nodoc
class _$ShopStateCopyWithImpl<$Res> implements $ShopStateCopyWith<$Res> {
  _$ShopStateCopyWithImpl(this._value, this._then);

  final ShopState _value;
  // ignore: unused_field
  final $Res Function(ShopState) _then;

  @override
  $Res call({
    Object? customer = freezed,
    Object? categories = freezed,
    Object? items = freezed,
    Object? cart = freezed,
    Object? cartItems = freezed,
    Object? timer = freezed,
  }) {
    return _then(_value.copyWith(
      customer: customer == freezed
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category?>?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<int?, List<Item?>?>?,
      cart: cart == freezed
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<Item?>?,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }

  @override
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value));
    });
  }

  @override
  $CartCopyWith<$Res>? get cart {
    if (_value.cart == null) {
      return null;
    }

    return $CartCopyWith<$Res>(_value.cart!, (value) {
      return _then(_value.copyWith(cart: value));
    });
  }
}

/// @nodoc
abstract class _$ShopStateCopyWith<$Res> implements $ShopStateCopyWith<$Res> {
  factory _$ShopStateCopyWith(
          _ShopState value, $Res Function(_ShopState) then) =
      __$ShopStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Customer? customer,
      List<Category?>? categories,
      Map<int?, List<Item?>?>? items,
      Cart? cart,
      List<Item?>? cartItems,
      Timer? timer});

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $CartCopyWith<$Res>? get cart;
}

/// @nodoc
class __$ShopStateCopyWithImpl<$Res> extends _$ShopStateCopyWithImpl<$Res>
    implements _$ShopStateCopyWith<$Res> {
  __$ShopStateCopyWithImpl(_ShopState _value, $Res Function(_ShopState) _then)
      : super(_value, (v) => _then(v as _ShopState));

  @override
  _ShopState get _value => super._value as _ShopState;

  @override
  $Res call({
    Object? customer = freezed,
    Object? categories = freezed,
    Object? items = freezed,
    Object? cart = freezed,
    Object? cartItems = freezed,
    Object? timer = freezed,
  }) {
    return _then(_ShopState(
      customer: customer == freezed
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category?>?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<int?, List<Item?>?>?,
      cart: cart == freezed
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      cartItems: cartItems == freezed
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<Item?>?,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }
}

/// @nodoc

class _$_ShopState implements _ShopState {
  const _$_ShopState(
      {this.customer,
      this.categories = const [],
      this.items = const {},
      this.cart,
      this.cartItems,
      this.timer});

  @override
  final Customer? customer;
  @JsonKey(defaultValue: const [])
  @override
  final List<Category?>? categories;
  @JsonKey(defaultValue: const {})
  @override
  final Map<int?, List<Item?>?>? items;
  @override
  final Cart? cart;
  @override
  final List<Item?>? cartItems;
  @override
  final Timer? timer;

  @override
  String toString() {
    return 'ShopState(customer: $customer, categories: $categories, items: $items, cart: $cart, cartItems: $cartItems, timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShopState &&
            (identical(other.customer, customer) ||
                const DeepCollectionEquality()
                    .equals(other.customer, customer)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.cart, cart) ||
                const DeepCollectionEquality().equals(other.cart, cart)) &&
            (identical(other.cartItems, cartItems) ||
                const DeepCollectionEquality()
                    .equals(other.cartItems, cartItems)) &&
            (identical(other.timer, timer) ||
                const DeepCollectionEquality().equals(other.timer, timer)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(customer) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(cart) ^
      const DeepCollectionEquality().hash(cartItems) ^
      const DeepCollectionEquality().hash(timer);

  @JsonKey(ignore: true)
  @override
  _$ShopStateCopyWith<_ShopState> get copyWith =>
      __$ShopStateCopyWithImpl<_ShopState>(this, _$identity);
}

abstract class _ShopState implements ShopState {
  const factory _ShopState(
      {Customer? customer,
      List<Category?>? categories,
      Map<int?, List<Item?>?>? items,
      Cart? cart,
      List<Item?>? cartItems,
      Timer? timer}) = _$_ShopState;

  @override
  Customer? get customer => throw _privateConstructorUsedError;
  @override
  List<Category?>? get categories => throw _privateConstructorUsedError;
  @override
  Map<int?, List<Item?>?>? get items => throw _privateConstructorUsedError;
  @override
  Cart? get cart => throw _privateConstructorUsedError;
  @override
  List<Item?>? get cartItems => throw _privateConstructorUsedError;
  @override
  Timer? get timer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShopStateCopyWith<_ShopState> get copyWith =>
      throw _privateConstructorUsedError;
}
