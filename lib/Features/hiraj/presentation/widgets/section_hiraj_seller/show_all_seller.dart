import 'package:flutter/material.dart';
import 'package:sahel_net/Features/hiraj/presentation/widgets/section_hiraj_seller/tab_bar_view_seller.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../../home/presentation/widgets/sub_category/custom_tap_bar.dart';
import '../../../data/models/hiraj_model.dart';

class ShowAllSeller extends StatelessWidget {
  const ShowAllSeller({super.key, required this.sellerData});

  final List<HirajSellerData> sellerData;

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = sellerData.map((data) {
      return Tab(
        text: data.nameHirajSelle,
      );
    }).toList();
    return DefaultTabController(
      length: sellerData.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('البائعين',style: AppStyles.styleSemiBold16,),

          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: CustomTapBar(tabs: tabs)),
        ),
        body: TabBarViewSeller(tabs: tabs, sellerData: sellerData),
      ),
    );
  }
}