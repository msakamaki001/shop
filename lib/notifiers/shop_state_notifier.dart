import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/api_client/api_repository.dart';
import 'package:shop/entity/cart/cart.dart';
import 'package:shop/entity/category/category.dart';
import 'package:shop/entity/customer/customer.dart';
import 'package:shop/entity/item/item.dart';
import 'package:state_notifier/state_notifier.dart';

part 'shop_state_notifier.freezed.dart';

@freezed
abstract class ShopState with _$ShopState {
  const factory ShopState({
    Customer? customer,
    @Default([]) List<Category?>? categories,
    @Default({}) Map<int?, List<Item?>?>? items,
    Cart? cart,
    List<Item?>? cartItems,
    Timer? timer,
  }) = _ShopState;
}

class ShopStateNotifier extends StateNotifier<ShopState> {
  ShopStateNotifier() : super(const ShopState()) {
    fetchCategories();
  }

  final client = ApiRepository();

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  Future<void> setCustomer({Customer? customer}) async {
    state = state.copyWith(customer: customer);
  }

  Future<void> setTimer(Timer timer) async {
    state = state.copyWith(timer: timer);
  }

  Future<void> fetchCategories() async {
    final categories = await client.fetchCategories();
    if (categories != null) {
      state = state.copyWith(categories: categories);
    }
  }

  Future<void> fetchItems(int categoryId) async {
    final items = await client.fetchItems(categoryId);
    if (items != null) {
      var data = {...?state.items};
      data[categoryId] = items;
      state = state.copyWith(items: data);
    }
  }

  Future<void> fetchCartItems(List<String> itemIds) async {
    state = state.copyWith(
        cart: Cart(itemIds: itemIds.map((e) => int.parse(e)).toList()));
    final cartItems = await client.fetchCartItems(state.cart!);
    state = state.copyWith(cartItems: cartItems);
  }

  Future<void> cartIn({itemId}) async {
    final cart = await SharedPreferences.getInstance();
    var inItems = cart.getStringList('inItems');
    if (inItems == null) {
      inItems = [];
      cart.setStringList('inItems', []);
    }
    inItems.add(itemId.toString());
    cart.setStringList('inItems', inItems);
  }

  Future<List<Item?>?> inItems() async {
    final cart = await SharedPreferences.getInstance();
    var inItems = cart.getStringList('inItems');
    await fetchCartItems(inItems!);
    return state.cartItems;
  }

  Future<void> deleteCartItem(int id) async {
    final cart = await SharedPreferences.getInstance();
    var inItems = cart.getStringList('inItems');
    if (inItems != null && inItems.length > 0) {
      inItems.removeWhere((String inId) => int.parse(inId) == id);
    }
    cart.setStringList('inItems', inItems!);
  }

  Future<bool> buyCartItems() async {
    final cart = await SharedPreferences.getInstance();
    var inItems = cart.getStringList('inItems');
    final result = await client.buyCartItems(inItems!);
    inItems.map((e) => int.parse(e)).toList().forEach((id) async {
      await deleteCartItem(id);
    });
    return result;
  }
}
