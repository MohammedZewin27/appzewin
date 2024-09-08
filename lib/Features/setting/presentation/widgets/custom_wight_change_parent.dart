import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';

import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../core/utils/widgets/my_box_container.dart';
import '../../../Layout/presentation/cubit/layout_cubit.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../cubit/setting_cubit.dart';
import 'custom_button_change_parent.dart';

class CustomWightChangeParent extends StatelessWidget {
  const CustomWightChangeParent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = ParentCubit.get(context);
    ParentCubit.get(context).fetchParent();
    return BlocConsumer<ParentCubit, ParentState>(
      listener: (context, state) {


      },
      builder: (context, state) {
        if (state is ParentSuccess) {
          var parentList = state.parentModel.dataParent ?? [];
          return state.parentModel.status==AppString.success?Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const MyBoxContainer(
                  radius: 12,
                  padding: 10,
                  child: Text(
                    'الاماكن المتاحه',
                    style: AppStyles.styleBold16,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    itemCount: parentList.length,
                    itemBuilder: (context, index) {
                      return CustomButtonChangeParent(
                        parentList: parentList[index],
                        onPressed: () {
                          SettingCubit.get(context).parentName=parentList[index].name??'';
                          SettingCubit.get(context).urlImage=parentList[index].appLogo??'';

                          ParentCubit.get(context).parentId !=
                                  parentList[index].id
                              ? cubit
                                  .changeParent(
                                      context: context,
                                      parentList: parentList[index])
                                  .whenComplete(() => SettingCubit.get(context)
                                      .changeDataSetting(
                                          parentModel: parentList[index]))
                                  .whenComplete(() {
                            // SettingCubit.get(context).fetchUserData();

                                  context.read<TabCubit>().switchTab(3);
                                })

                              : Navigator.pop(context);
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ):const Center(child: CustomProgressIndicator());
        }
        return const Center(child: CustomProgressIndicator());
      },
    );
  }
}
