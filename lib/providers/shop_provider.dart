import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/notifiers/shop_state_notifier.dart';

final shopProvider = StateNotifierProvider<ShopStateNotifier, ShopState>(
    (ref) => ShopStateNotifier());
