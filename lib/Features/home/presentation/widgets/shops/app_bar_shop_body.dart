import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/widgets/cashed_image.dart';

import '../../../data/models/home_model.dart';

class AppBarShopBody extends StatelessWidget {
  const AppBarShopBody({super.key, required this.shopsData});

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
              tag: 'SHOPBODY${shopsData.shopId}',
              child: CachedImage(url: shopsData.shopImage ?? '')),
        ),

      ],
    );
  }
}