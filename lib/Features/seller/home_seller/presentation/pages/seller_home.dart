import 'package:auto_size_text/auto_size_text.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sahel_net/Features/seller/core/const.dart';
import 'package:sahel_net/Features/seller/seller_post/presentation/cubit/post_seller_cubit.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';

import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/custom_Title_and_details.dart';
import '../../../../choose_user/presentation/cubit/seller_full_active_cubit.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';

class SellerHome extends StatelessWidget {
  const SellerHome({
    super.key,
    this.sellerData,
  });

  final SellerData? sellerData;

  @override
  Widget build(BuildContext context) {
    PostSellerCubit.get(context)
        .fetchPostOfSeller(sellerId: sellerData?.idHirajSeller ?? 0);

    return
        //Text(sellerData?.codeHirajSelle??'654');
        RefreshIndicator(
      onRefresh: () {
        // PostSellerCubit.get(context)
        //     .fetchPostOfSeller(sellerId: sellerData?.idHirajSeller ?? 0);
        return SellerFullActiveCubit.get(context).getSellerData();

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorManager.primary7),
                  child: Text(
                    sellerData?.nameHirajSelle ?? '',
                    style:
                        AppStyles.styleSemiBold20.copyWith(color: Colors.white),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MyBoxContainer(
                  radius: 12,
                  margin: 10,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: CachedImage(url: sellerData?.imageHirajSeller ?? ''),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTitleAndDetails(
                  copyIconActive: true,
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: sellerData?.codeHirajSelle ?? ''));
                      CherryToast.info(title:Text( 'تم نسخ الكود'),).show(context);
                     
                    },
                    text: 'كود', details: sellerData?.codeHirajSelle ?? ''),
                const SizedBox(
                  height: 25,
                ),
                CustomTitleAndDetails(
                    text: 'العنوان', details: sellerData?.addressSeller ?? ''),
                const SizedBox(
                  height: 25,
                ),
                CustomTitleAndDetails(
                    text: 'جوال', details: sellerData?.phoneSeller ?? ''),
                const SizedBox(
                  height: 25,
                ),
                CustomTitleAndDetails(
                    text: 'عدد المنتجات',
                    details: dataPostToSeller.length.toString() ?? ''),
                const SizedBox(
                  height: 25,
                ),
                CustomTitleAndDetails(
                    text: 'التقييم',
                    details: sellerData?.ratingSeller.toString() ?? '1'),
                const SizedBox(
                  height: 25,
                ),
                CustomTitleAndDetails(
                    text: 'تاريخ البدء',
                    details: sellerData?.startSeller?.substring(0,11) ?? ''),
                SizedBox(height: 25,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


