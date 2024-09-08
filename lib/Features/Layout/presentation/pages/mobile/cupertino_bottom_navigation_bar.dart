import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/Layout/presentation/cubit/layout_cubit.dart';
import 'package:sahel_net/Features/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:sahel_net/Features/hiraj/presentation/pages/hiraj.dart';
import 'package:sahel_net/Features/search/preasention/views/SearchView.dart';
import 'package:sahel_net/Features/setting/presentation/pages/setting_view.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../home/presentation/pages/home_view.dart';

class CupertinoBottomNavigationBar extends StatefulWidget {
  const CupertinoBottomNavigationBar({super.key, });

  @override
  State<CupertinoBottomNavigationBar> createState() => _CupertinoBottomNavigationBarState();
}

class _CupertinoBottomNavigationBarState extends State<CupertinoBottomNavigationBar> {

  @override
  void initState() {
    super.initState();
    tabController = CupertinoTabController(initialIndex: 3);
  }

  // @override
  // void dispose() {
  //   tabController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: tabController,
      tabBar: CupertinoTabBar(

        onTap: (value) {
          setState(() {
            tabController.index = value;
            print('====================${tabController.index }===================');
            DrawerCubit.get(context).changeIndexItemsDrawer(index: tabController.index);
            print('====================${DrawerCubit.get(context).indexItemsInDrawer}=======Drawer============');

          },);


        },
        height: MediaQuery.sizeOf(context).height / 16,
        iconSize: getResponsiveSize(context, size: 16),
         currentIndex:  tabController.index,
        activeColor: ColorManager.primary,

        // border: Border.all(color:const Color(0xFFF1F1F1)),
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(

            icon: Icon(CupertinoIcons.ellipsis_circle),
            activeIcon: Icon(CupertinoIcons.ellipsis_circle_fill),
            label: 'المزيد',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search_circle),
            activeIcon: Icon(CupertinoIcons.search_circle_fill),
            label: 'بحث',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_grid_hex),
            activeIcon: Icon(CupertinoIcons.circle_grid_hex_fill),
            label: 'متاجر',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            activeIcon: Icon(CupertinoIcons.house_fill),
            label: 'الرئيسية',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        print(index);
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return const CupertinoPageScaffold(

                  child: Scaffold(
                    body: SettingView(),
                  ),
                );
                //screens[index];
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return  const CupertinoPageScaffold(
                  child: Scaffold(
                    body: SearchView(),
                  ),
                );
                //screens[index];
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return  const CupertinoPageScaffold(
                  child: Hiraj(),
                );

                //screens[index];
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return  const CupertinoPageScaffold(
                  child: HomeView(),
                );
                //screens[index];
              },
            );
          default:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return  const CupertinoPageScaffold(
                  child: HomeView(),
                );
                //screens[index];
              },
            );
        }
      },
    );
  }
}
