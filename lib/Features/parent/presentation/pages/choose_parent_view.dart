import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../../core/utils/widgets/log_name_and_logo.dart';
import '../cubit/parent_cubit.dart';
import '../widgets/chose_parent_build_items.dart';

class ChooseParent extends StatelessWidget {
  const ChooseParent({super.key});

  @override
  Widget build(BuildContext context) {
    ParentCubit.get(context).fetchParent();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primary5,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Column(
              children: [
                 LogNameAndLogo()
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).width * .7,
                ),
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        'اختر من المناطق المتاحة ',
                        style: AppStyles.styleBold16
                            .copyWith(color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ChoseParentBuildItems(),
                      SizedBox(
                        height:  MediaQuery.sizeOf(context).height *.2,
                      ),
                      const Divider(),

                      Text(
                        'يمكن تغير المنطقة من داخل البرنامج ',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: AppStyles.styleSemiBold16
                            .copyWith(color: Colors.black87),
                      ),
                      const Divider(),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height /3.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


