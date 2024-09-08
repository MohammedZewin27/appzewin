import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/widgets/sub_category/tap_bar_body.dart';
import 'package:sahel_net/core/utils/widgets/screen_add.dart';

import '../../../../../core/utils/const/constant_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../data/models/home_model.dart';
import '../shop_body_view.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    super.key,
    required this.tabs,
    required this.subCategoryData,
  });

  final List<Tab> tabs;
  final List<SubcategoriesData> subCategoryData;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: tabs.map((tab) {
        int indexTab = tabs.indexOf(tab);
        List<ShopsData> shops =
            subCategoryData[indexTab].shops?.shopsData ?? [];
        return shops.isNotEmpty &&
                subCategoryData[indexTab].shops?.status == AppString.success
            ? Padding(
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

                    isFavoriteShop[shops[index].shopId]=shops[index].shopFavorite;/// favorite
                    return GestureDetector(
                      onTap: () {
                      Navigator.push(
                                context,
                        MaterialPageRoute(
                                  builder: (context) => ShopBodyView(
                                    shopsData: shops[index],
                                  ),
                                ),
                              )
                           ;
                      },
                      child: Hero(
                          tag: 'SHOPBODY${shops[index].shopImage}',
                          child: TapBarBody(shop: shops[index])),
                    );
                  },
                ),
              )
            : const ScreenAdd(titleButton: 'اضف محلك او مهنتك من هنا ',);



        Center(child: Text('${AppString.noCategory}${tab.text}'));
      }).toList(),
    );
  }
}
