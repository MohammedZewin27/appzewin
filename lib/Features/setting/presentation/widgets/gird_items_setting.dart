import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../data/models/items_setting_model.dart';
import 'custom_items_setting.dart';

class GirdItemsSetting extends StatelessWidget {
  const GirdItemsSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var items = ItemsSettingModel.getItems(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: AnimationLimiter(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 10/9),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  horizontalOffset: -120,
                  child: FadeInAnimation(
                    child: CustomItemsSetting(
                      itemsSetting: items[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
