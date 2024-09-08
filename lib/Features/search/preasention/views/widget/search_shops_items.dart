import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../home/data/models/home_model.dart';

class SearchShopsItems extends StatelessWidget {
  const SearchShopsItems({
    super.key,
    required this.shops,
  });

  final ShopsData shops;

  @override
  Widget build(BuildContext context) {
    return MyBoxContainer(
      radius: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListTile(
              trailing: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  width: 50,
                  height: 50,
                  child: CachedImage(url: shops.shopImage ?? '')),
              title: Text(
                shops.shopName ?? '',
                style: AppStyles.styleSemiBold12,
                textDirection: TextDirection.rtl,
              ),
              subtitle: Text(shops.shopInformation ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl),
              leading: const Icon(
                Icons.arrow_back_ios_new,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}