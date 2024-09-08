import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../generated/assets.dart';
import '../cash_data.dart';
import '../theme/styles_manager.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.mail,
  });

  final String title, subtitle, mail;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: CacheData.getData(key: StringCache.userId) != 0?Column(
        children: [
          Image.asset(
            Assets.imagesLogo,
            width: MediaQuery.sizeOf(context).width / 6,
            height: MediaQuery.sizeOf(context).width / 6,
          ),
         ListTile(
            title: Center(
              child: AutoSizeText(
                title,
                style: AppStyles.styleSemiBold16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
            ),
            subtitle: Column(
              children: [
                Center(
                  child: Text(
                    mail,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleRegular14,
                  ),
                ),
                Center(
                  child: Text(
                    subtitle,
                    style: AppStyles.styleRegular12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ):Column(
        children: [
          Image.asset(
            Assets.imagesLogo,
            width: MediaQuery.sizeOf(context).width / 6,
            height: MediaQuery.sizeOf(context).width / 6,
          ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'لك',
            style: AppStyles.styleSemiBoldQahiri60.copyWith(color: ColorManager.primary7,fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(width: 2,),
          AutoSizeText(
            'سهلنا',
            style: AppStyles.styleSemiBoldQahiri60.copyWith(color: ColorManager.primary7),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
        ],
      ),
    );
  }
}
