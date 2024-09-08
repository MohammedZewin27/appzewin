import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/drawer/presentation/cubit/drawer_cubit.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../Layout/presentation/cubit/layout_cubit.dart';
import '../../../favorite/presentation/pages/favorite_view.dart';
import '../../data/models/drawer_item_model.dart';
import '../../../setting/presentation/widgets/custom_wight_change_parent.dart';

import '../../../drawer/presentation/widgets/drawer_item.dart';

class DrawerItemsListView extends StatefulWidget {
  const DrawerItemsListView({
    super.key,
  });

  @override
  State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
}

class _DrawerItemsListViewState extends State<DrawerItemsListView> {
  final List<DrawerItemModel> items = const [
    DrawerItemModel(
        title: ' الرئيسية',
        notActiveIcon: CupertinoIcons.house,
        isActiveIcon: CupertinoIcons.house_fill),
    DrawerItemModel(
        title: 'متاجر',
        notActiveIcon: CupertinoIcons.circle_grid_hex,
        isActiveIcon: CupertinoIcons.circle_grid_hex_fill),
    DrawerItemModel(
        title: ' بحث',
        notActiveIcon: CupertinoIcons.search,
        isActiveIcon: CupertinoIcons.search_circle_fill),
    DrawerItemModel(
      title: ' المفضلة',
      notActiveIcon: CupertinoIcons.star,
      isActiveIcon: CupertinoIcons.star_fill,
    ),
    DrawerItemModel(
      title: ' تبديل المتجر',
      notActiveIcon: CupertinoIcons.arrow_swap,
      isActiveIcon: CupertinoIcons.arrow_swap,
    ),
    DrawerItemModel(
        title: 'الاعدادات',
        notActiveIcon: CupertinoIcons.gear_alt,
        isActiveIcon: CupertinoIcons.gear_alt_fill)
  ];

  // int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              Navigator.pop(context);
              context.read<TabCubit>().switchTab(3);
            } else if (index == 1) {
              Navigator.pop(context);
              context.read<TabCubit>().switchTab(2);
            } else if (index == 2) {
              Navigator.pop(context);
              context.read<TabCubit>().switchTab(1);
            } else if (index == 3) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteView(),
                ),
              );
            } else if (index == 4) {
              Navigator.pop(context);
              showModalBottomSheet(
                  backgroundColor: ColorManager.backTextFrom,
                  context: context,
                  builder: (context) {
                    return const CustomWightChangeParent();
                  });
            } else if (index == 5) {
              Navigator.pop(context);
              context.read<TabCubit>().switchTab(0);
            }
            setState(() {
              if (DrawerCubit.get(context).indexItemsInDrawer != index) {
                DrawerCubit.get(context).indexItemsInDrawer = index;
              }
            });
          },
          child: DrawerItem(
            itemModel: items[index],
            isActive: DrawerCubit.get(context).indexItemsInDrawer == index,
          ),
        );
      },
    );
  }
}
