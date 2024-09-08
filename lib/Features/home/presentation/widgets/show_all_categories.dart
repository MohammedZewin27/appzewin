import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/widgets/shops/shops.dart';
import 'package:sahel_net/Features/home/presentation/widgets/sub_category/custom_tap_bar.dart';

import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';
import '../../../../core/utils/widgets/logo_app_bar.dart';
import '../../data/models/home_model.dart';

class ShowAllCategories extends StatelessWidget {
  const ShowAllCategories({super.key, required this.data});

  final List<CategoriesData> data;

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = data.map((dataTabs) {
      return Tab(
        text: dataTabs.categoryName,
        icon: CachedImage(
          url: dataTabs.categoryImage ?? '',
          width: 20,
          height: 20,
          sizeIndicator: 10,
        ),
      );
    }).toList();
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
          appBar: AppBar(
            actions: const [
              LogoAppBar(size: 23),
            ],
            title: const Text(
              AppString.allShops,
              style: AppStyles.styleSemiBoldAppBar,
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: CustomTapBar(tabs: tabs)),
          ),
          body: TabBarView(
              children: tabs.map((tab) {
            int indexTab = tabs.indexOf(tab);
            List<SubcategoriesData> dataCategory =
                data[indexTab].subcategories?.subcategoriesData ?? [];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  // mainAxisExtent: 250
                ),
                itemCount: dataCategory.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 4),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      child: Row(
                        children: [
                          Container(
                            color: ColorManager.primary7,
                            height: double.infinity,
                            width: 15,
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hoverColor: ColorManager.primary5,
                              splashColor:
                                  ColorManager.primary.withOpacity(.47),
                              onTap: () {
                                List<ShopsData> shopsData =
                                    dataCategory[index].shops?.shopsData ?? [];
                                shopsData.isNotEmpty
                                    ? Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => ShopsViews(
                                                shops: dataCategory[index]
                                                    .shops!
                                                    .shopsData!)),
                                      )
                                    : CherryToast.info(
                                        title: Text(
                                            'قريبا سوف يضاف محلات في قسم ${dataCategory[index].subcategoriesTitle}'),
                                      ).show(context);
                              },
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    dataCategory[index].subcategoriesTitle ??
                                        '',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                    style: AppStyles.styleBold16
                                        .copyWith(color: ColorManager.primary),
                                  ),
                                ],
                              ),
                              subtitle: dataCategory[index].shops?.status ==
                                      AppString.success
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          ' ${dataCategory[index].shops?.shopsData!.length}',
                                          textDirection: TextDirection.rtl,
                                          style: AppStyles.styleSemiBold16
                                              .copyWith(
                                                  color:
                                                      ColorManager.lightOrange),
                                        ),
                                        Text(
                                          'عدد المحلات ',
                                          textDirection: TextDirection.rtl,
                                          style: AppStyles.styleSemiBold12
                                              .copyWith(color: Colors.black54),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'عدد المحلات 0',
                                          textDirection: TextDirection.rtl,
                                          style: AppStyles.styleSemiBold12
                                              .copyWith(color: Colors.black54),
                                        ),
                                      ],
                                    ),
                              leading: FittedBox(
                                child: CachedImage(
                                  url: dataCategory[index].subcategoriesImage ??
                                      '',
                                  width: 35,
                                  height: 35,
                                  sizeIndicator: 5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList())),
    );
  }
}
