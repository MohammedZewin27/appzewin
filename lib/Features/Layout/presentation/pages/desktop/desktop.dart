import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../../drawer/presentation/pages/drawer_view.dart';
import '../mobile/cupertino_bottom_navigation_bar.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: CustomDrawer()),
         const Expanded(flex: 3, child: CupertinoBottomNavigationBar()),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    'Mohammed ',
                    style: AppStyles.styleSemiBold24.copyWith(
                        fontSize: getResponsiveSize(context, size: 22)),
                  ),),
                  Center(
                      child: Text(
                    'zewin ',
                    style: AppStyles.styleSemiBold24.copyWith(
                        fontSize: getResponsiveSize(context, size: 22)),
                  ),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
