import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop/api_client/api_repository.dart';
import 'package:shop/entity/login/login_state.dart';
import 'package:shop/providers/shop_provider.dart';
import 'package:state_notifier/state_notifier.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier(this.ref) : super(const LoginState());

  // ApiClientService get apiService => ref.read<ApiClientService>();
  final ProviderReference ref;
  final client = ApiRepository();

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void initState() {}

  Future<void> setEmail(String mail) async {
    state = state.copyWith(mail: mail);
  }

  Future<void> setPassword(String password) async {
    state = state.copyWith(password: password);
  }

  Future<bool> login() async {
    final customer = await client.loginApi(state);
    if (customer != null) {
      ref.read(shopProvider.notifier).setCustomer(customer: customer);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
