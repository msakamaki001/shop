import 'package:chopper/chopper.dart';
import 'package:shop/entity/cart/cart.dart';
import 'package:shop/entity/login/login_state.dart';

part 'api_client.chopper.dart';

@ChopperApi(baseUrl: '/api')
abstract class ApiClient extends ChopperService {
  static ApiClient create([ChopperClient? client]) => _$ApiClient(client);

  @Post(path: '/login')
  Future<Response> loginApi(
    @Body() LoginState data,
  );
  @Post(path: '/fetch_categories')
  Future<Response> fetchCategories();
  @Post(path: '/fetch_items')
  Future<Response> fetchItems(@Body() Map<String, int> categoryId);
  @Post(path: '/fetch_cart_items')
  Future<Response> fetchCartItems(@Body() Cart cart);
  @Post(path: '/buy_cart_items')
  Future<Response> buyCartItems(@Body() Map<String, List<String>> data);
}
