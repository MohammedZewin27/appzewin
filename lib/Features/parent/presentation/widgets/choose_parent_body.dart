import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/Layout/presentation/pages/layout.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';

import '../../data/models/parent_model.dart';
import '../cubit/parent_cubit.dart';

class ChooseParentItems extends StatelessWidget {
  const ChooseParentItems({
    super.key,
    required this.parentData,
  });

  final DataParent parentData;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Card(
          elevation: 20,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: InkWell(
                  splashColor: ColorManager.primary,
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    ParentCubit.get(context).parentId = parentData.id!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          CacheData.setData(
                              key: StringCache.idParent,
                              value: parentData.id);
                          CacheData.setData(
                              key: StringCache.appLogo,
                              value: parentData.appLogo);
                          CacheData.setData(
                              key: StringCache.backgroundImage,
                              value: parentData.backgroundImage);
                          CacheData.setData(
                              key: StringCache.parentName,
                              value: parentData.name);
                          CacheData.setData(
                              key: StringCache.appDescription,
                              value: parentData.appDescription);
                          CacheData.setData(
                              key: StringCache.userName,
                              value: '');
                          CacheData.setData(
                              key: StringCache.userEmail,
                              value: '');
                          CacheData.setData(
                              key: StringCache.userPhone,
                              value: '');
                          CacheData.setData(
                              key: StringCache.userId,
                              value: 0);
                          CacheData.setData(key: StringCache.activeUser, value: true);

                          return const Layout();
                          //   SignInView(
                          //   dataParent: parentData,
                          // );
                        },
                      ),
                    );
                  },
                  child: CachedImage(
                    url: parentData.appLogo ?? '',
                  ),
                ),
              )),
        ),
        const SizedBox(height: 15,),
        AutoSizeText(
          parentData.name ?? '',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
          style: AppStyles.styleSemiBold12.copyWith(color: Colors.black87),
        ),
      ],
    );
  }
}
