import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:sahel_net/Features/home/presentation/widgets/show_all_categories.dart';
import 'package:sahel_net/Features/home/presentation/widgets/sub_category.dart';

import 'package:sahel_net/core/utils/widgets/custom_header_view_all.dart';
import '../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../core/utils/theme/strings_manager.dart';

import '../../data/models/home_model.dart';
import 'customItem_circular.dart';


class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.categoriesModel,
  });

  final Categories categoriesModel;

  @override
  Widget build(BuildContext context) {
    List<CategoriesData> data = categoriesModel.categoriesData ?? [];
    return data.isNotEmpty
        ? SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomHeaderViewAll(
                    title: AppString.categories,
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return ShowAllCategories(
                            data: data,
                          );
                        },
                      ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: getResponsiveSize(context, size: 80),
                  child: AnimationLimiter(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1000),
                          child: SlideAnimation(
                            horizontalOffset: -120,
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  data[index].subcategories?.status ==
                                          AppString.success
                                      ? Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                SubCategoryView(
                                                    categoriesData:
                                                        data[index]),
                                          ),
                                        )
                                      : null;/// تعديل
                                },
                                child: CustomItemCircular(
                                    image: data[index].categoryImage ?? '',
                                    title: data[index].categoryName ?? ''),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          )
        : const SliverToBoxAdapter(
            child: SizedBox(),
          );
  }
}






