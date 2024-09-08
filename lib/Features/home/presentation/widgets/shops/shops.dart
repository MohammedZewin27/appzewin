import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/home_model.dart';
import '../shop_body_view.dart';
import '../sub_category/tap_bar_body.dart';

class ShopsViews extends StatelessWidget {
  const ShopsViews({super.key, required this.shops});

  final List<ShopsData> shops;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 16 / 14,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 250),
          itemCount: shops.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ShopBodyView(
                      shopsData: shops[index],
                    ),
                  ),
                );
              },
              child: TapBarBody(shop: shops[index]),
            );
          },
        ),
      ),
    );
  }
}