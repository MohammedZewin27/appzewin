import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/data/models/home_model.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/widgets/Image_app_bar.dart';

import 'sub_category/custom_tab_bar_view.dart';
import 'sub_category/custom_tap_bar.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key, required this.categoriesData});

  final CategoriesData categoriesData;

  @override
  Widget build(BuildContext context) {
    List<SubcategoriesData> subCategoryData =
        categoriesData.subcategories?.subcategoriesData ?? [];
    List<Tab> tabs = subCategoryData.map((data) {
      return Tab(
        text: data.subcategoriesTitle,
        icon: SizedBox(
          height: 20,
          width: getResponsiveSize(context, size: 20),
          child: CachedImage(url: data.subcategoriesImage ?? '',sizeIndicator: 10,),
        ),
      );
    }).toList();
    return categoriesData.subcategories?.status== AppString.success? DefaultTabController(
      length: subCategoryData.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: CustomTapBar(tabs: tabs)),
          actions: [
            ImageAppBar(url: categoriesData.categoryImage ?? ''),
          ],
          title: Text(categoriesData.categoryName ?? ''),
        ),
        body: CustomTabBarView(tabs: tabs, subCategoryData: subCategoryData),
      ),
    ):const SizedBox();
  }
}
