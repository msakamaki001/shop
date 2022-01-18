import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop/entity/login/login_state.dart';
import 'package:shop/notifiers/login_state_notifier.dart';

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
    (ref) => LoginStateNotifier(ref));
