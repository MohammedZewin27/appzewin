import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/widgets/custom_header_view_all.dart';
import '../../../data/models/hiraj_model.dart';
import '../view_all_hiraj_category.dart';
import 'hiraj_category_body.dart';

class HirajCategoryView extends StatelessWidget {
  const HirajCategoryView({
    super.key,
    required this.hirajData,
  });

  final List<HirajData> hirajData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomHeaderViewAll(
              title: 'الاقسام',
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return ViewAllHirajCategory(
                        hirajData: hirajData,
                      );
                    },
                  ),
                );
              },
            ),
            HirajCategory(hirajData: hirajData),
          ],
        ),
      ),
    );
  }
}


