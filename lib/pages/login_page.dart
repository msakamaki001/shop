import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop/pages/shop_page.dart';
import 'package:shop/providers/login_provider.dart';

class LoginPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final loginStateNotifier = useProvider(loginProvider.notifier);
    final loginState = useProvider(loginProvider);
    final _formKey = GlobalObjectKey<FormState>('form1');
    final formWidth = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: formWidth,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'メールアドレス',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'メールアドレスを入力して下さい';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        loginStateNotifier.setEmail(value);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'パスワード',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'パスワードを入力して下さい';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        loginStateNotifier.setPassword(value);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final isLogin = await loginStateNotifier.login();
                          if (isLogin) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopPage(),
                                ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('ログイン失敗')));
                          }
                        }
                      },
                      child: Text('ログイン'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
