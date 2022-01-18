import 'package:shop/entity/cart/cart.dart';
import 'package:shop/entity/category/category.dart';
import 'package:shop/entity/customer/customer.dart';
import 'package:shop/entity/item/item.dart';
import 'package:shop/entity/login/login_state.dart';

import 'api_client.dart';
import 'api_client_creator.dart';

class ApiRepository {
  final ApiClient client = ApiClient.create(ApiClientCreator.create());

  @override
  Future<Customer?> loginApi(LoginState loginState) async {
    final response = await this.client.loginApi(loginState);

    if (response.isSuccessful) {
      final responseBodyJson = response.body as Map<String, dynamic>;
      final result = Customer.fromJson(responseBodyJson);
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<List<Category?>?> fetchCategories() async {
    final response = await this.client.fetchCategories();

    if (response.isSuccessful) {
      final responseBodyJson = response.body as List<dynamic>;
      final result = responseBodyJson.map((e) => Category.fromJson(e)).toList();
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<List<Item?>?> fetchItems(int categoryId) async {
    final response = await this.client.fetchItems({'categoryId': categoryId});

    if (response.isSuccessful) {
      final responseBodyJson = response.body as List<dynamic>;
      final result = responseBodyJson.map((e) => Item.fromJson(e)).toList();
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<List<Item?>?> fetchCartItems(Cart cart) async {
    final response = await this.client.fetchCartItems(cart);

    if (response.isSuccessful) {
      final responseBodyJson = response.body as List<dynamic>;
      final result = responseBodyJson.map((e) => Item.fromJson(e)).toList();
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<bool> buyCartItems(List<String> data) async {
    final response = await this.client.buyCartItems({'cartItems': data});
    if (response.isSuccessful) {
      return true;
    } else {
      return false;
    }
  }
}
