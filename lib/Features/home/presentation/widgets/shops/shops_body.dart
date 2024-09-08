import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../data/models/home_model.dart';
import 'custom_communication_shop.dart';
import 'custom_details_shop.dart';


class ShopsBody extends StatelessWidget {
  const ShopsBody({
    super.key,
    required this.shopsData,
  });

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomCommunicationShop(shopsData: shopsData),
          CustomDetailsShop(shopsData: shopsData),
        ],
      ),
    );
  }
}








