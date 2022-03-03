import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shop/providers/shop_provider.dart';
import 'package:shop/setting.dart';

class CategoryPage extends HookWidget {
  CategoryPage(this.categoryId);

  int categoryId;

  @override
  Widget build(BuildContext context) {
    final shopStateNotifier = useProvider(shopProvider.notifier);
    final shopState = useProvider(shopProvider);

    useEffect(() {
      () async {
        await shopStateNotifier.fetchItems(categoryId);
      }();

      final timer = Timer.periodic(
        const Duration(seconds: 5), // 5秒毎に定期実行
        (Timer timer) async {
          await shopStateNotifier.fetchItems(categoryId);
        },
      );

      return () {}; // dispose 処理がある場合ここで関数をもどす
    }, const []);

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      children: (shopState.items![categoryId] != null)
          ? shopState.items![categoryId]!
              .map(
                (e) => GestureDetector(
                  child: Stack(
                    children: <Widget>[
                      Image.network(Setting.BASE_URL.contains('10.0.2.2')
                          ? e!.image_path!.replaceFirst('localhost', '10.0.2.2')
                          : e!.image_path!),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          e.name!,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text('${e.price!.toString()}円'),
                      )
                    ],
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('カートに入れますか？'),
                          content: Text(e.name!),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('いいえ'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                shopStateNotifier.cartIn(
                                    itemId: e.id!.toString());
                                Navigator.pop(context);
                              },
                              child: Text('はい'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              )
              .toList()
          : [],
    );
  }
}
