import 'package:flutter/material.dart';
import 'package:sahel_net/Features/Layout/presentation/cubit/layout_cubit.dart';
import 'package:sahel_net/Features/Layout/presentation/pages/desktop/desktop.dart';
import 'package:sahel_net/Features/setting/presentation/cubit/setting_cubit.dart';
import 'package:sahel_net/core/utils/widgets/adaptive%20layout.dart';

import '../../../parent/presentation/cubit/parent_cubit.dart';
import 'mobile/cupertino_bottom_navigation_bar.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit.get(context).fetchDialogAdvertisement(idParent: ParentCubit
        .get(context)
        .parentId);
    SettingCubit.get(context).fetchUserData();
    return PopScope(
      canPop: true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AdaptiveLayout(
          mobileLayout: (context) => const CupertinoBottomNavigationBar(),
          tabletLayout: (context) => const CupertinoBottomNavigationBar(),
          desktopLayout: (context) => const Center(child: DesktopLayout()),
        ),
      )
    );
  }
}
