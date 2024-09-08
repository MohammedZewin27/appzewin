import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/function/call_me.dart';

import '../../../generated/assets.dart';
import '../theme/color_manager.dart';
import '../theme/styles_manager.dart';

class ScreenAdd extends StatelessWidget {
  const ScreenAdd({
    super.key, this.image, this.text, this.phone, this.titleButton, this.icon,
  });
final String? image;
final String? text;
final String? phone;
final String? titleButton;
final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image?? Assets.imagesAddStore,
            height: MediaQuery.sizeOf(context).width / 3,
            width: MediaQuery.sizeOf(context).width / 3,
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AutoSizeText(
              text??' نأسف , لا يوجد متاجر حاليا في هذا القسم , إذا كان لديك متجر او منتج تريد اضافتة في هذا القسم يمكنك الضغط على اضافة متجرك ',
              textDirection: TextDirection.rtl,
              maxLines: 3,
              textAlign: TextAlign.center,

              style: AppStyles.styleSemiBold12
                  .copyWith(color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.lightGreen),
              onPressed: () {
                callMe(context,phone: phone,titleShowBottom: titleButton);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Icon(
                    icon??Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width/3,
                    child: AutoSizeText(
                      titleButton??'اضافة متجرك هنا',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: AppStyles.styleRegular16
                          .copyWith(color: ColorManager.white),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}