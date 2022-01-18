import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/providers/shop_provider.dart';

import 'category_page.dart';

class ShopPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final shopStateNotifier = useProvider(shopProvider.notifier);
    final shopState = useProvider(shopProvider);
    useEffect(() {
      () async {
        await shopStateNotifier.fetchCategories();
      }();
      final timer = Timer.periodic(
        const Duration(seconds: 5), // 5秒毎に定期実行
        (Timer timer) async {
          await shopStateNotifier.fetchCategories();
        },
      );
      return () {}; // dispose 処理がある場合ここで関数をもどす
    }, const []);

    return MaterialApp(
      home: DefaultTabController(
        length:
            (shopState.categories == null) ? 0 : shopState.categories!.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Shop'),
            bottom: TabBar(
              isScrollable: true,
              tabs: (shopState.categories == null)
                  ? []
                  : shopState.categories!.map((e) {
                      return Tab(
                        text: e!.name,
                      );
                    }).toList(),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  final inItems = await shopStateNotifier.inItems();
                  final cart = await SharedPreferences.getInstance();
                  var inCart = cart.getStringList('inItems');
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('購入しますか？'),
                        content: (inItems!.length <= 0)
                            ? Text('カートは空です')
                            : SizedBox(
                                height: 200,
                                width: double.maxFinite,
                                child: ListView.builder(
                                  itemCount: inItems.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, int index) {
                                    return Dismissible(
                                      key: UniqueKey(),
                                      child: Card(
                                        child: ListTile(
                                          leading: Image.network(
                                              inItems[index]!.image_path!),
                                          title: Text(inItems[index]!.name!),
                                          subtitle: Text(
                                              '${inItems[index]!.price!.toString()}円'),
                                        ),
                                      ),
                                      onDismissed: (direction) async {
                                        await shopStateNotifier.deleteCartItem(
                                            inItems[index]!.id!);
                                        final cart = await SharedPreferences
                                            .getInstance();
                                        var data =
                                            cart.getStringList('inItems');
                                        if (data != null && data.isEmpty) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      background: Container(
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                ),
                              ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('いいえ'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final result =
                                  await shopStateNotifier.buyCartItems();
                              if (result) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('購入しました')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('購入できませんでした')));
                              }
                              Navigator.pop(context);
                            },
                            child: Text('はい'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
          body: (shopState.categories != null)
              ? TabBarView(
                  children: shopState.categories!.map((e) {
                    return CategoryPage(e!.id!);
                  }).toList(),
                )
              : Container(),
        ),
      ),
    );
  }
}
