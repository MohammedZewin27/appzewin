import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../data/models/home_model.dart';

class CustomShopServices extends StatelessWidget {
  const CustomShopServices({
    super.key,
    required this.shopsData,
  });

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    return shopsData.shopServices?.status == AppString.success
        ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'خدمات  : ',
                  style:
                      AppStyles.styleRegular14.copyWith(color: Colors.blue[800]),
                  textDirection: TextDirection.rtl,
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 40 /5,
                      mainAxisExtent: 30,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: shopsData.shopServices!.servicesData!.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: index.isEven
                              ? ColorManager.pistachio.withOpacity(1)
                              : ColorManager.lightPetrol.withOpacity(1),
                          shadows: [
                            BoxShadow(
                                offset: const Offset(2, 2),
                                color: index.isEven
                                    ? ColorManager.pistachio.withOpacity(1)
                                    : ColorManager.lightPetrol.withOpacity(1))
                          ],
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 2, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            shopsData.shopServices!.servicesData?[index]
                                    .shopServices ??
                                '',
                            style: AppStyles.styleSemiBold16,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
        )
        : const SizedBox.shrink();
  }
}
