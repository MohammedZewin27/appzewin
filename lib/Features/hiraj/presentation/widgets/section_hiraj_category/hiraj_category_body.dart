import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../data/models/hiraj_model.dart';
import 'hiraj_category_item.dart';
import 'items_category_hiraj.dart';

class HirajCategory extends StatelessWidget {
  const HirajCategory({
    super.key,
    required this.hirajData,
  });

  final List<HirajData> hirajData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:6,
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          reverse: true,
          itemCount: hirajData.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                horizontalOffset: -120,
                child: FadeInAnimation(
                  child: GestureDetector(
                      onTap: () {
                        // hirajData[index].hirajSeller?.status ==AppString.success?
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return ItemsCategoryHiraj(hirajData: hirajData[index]);
                            },
                          ),
                        );
                        // :null;
                      },
                      child: HirajCategoryItem(hirajData: hirajData[index])),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


