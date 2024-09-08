import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/setting/presentation/cubit/setting_cubit.dart';
import 'package:sahel_net/core/utils/function/functions.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../../generated/assets.dart';
import '../../../data/models/user_date.dart';
import '../text_form_update_information.dart';
import 'circle_image_stack.dart';

class UserUpdateData extends StatefulWidget {
  const UserUpdateData({
    super.key,
    this.dataUser,
  });

  final UserDataSetting? dataUser;

  @override
  State<UserUpdateData> createState() => _UserUpdateDataState();
}

class _UserUpdateDataState extends State<UserUpdateData> {
  late GlobalKey<FormState> formKeyUpdate;

  @override
  void initState() {
    formKeyUpdate = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKeyUpdate.currentState?.dispose();
    super.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    nameController.text =
        SettingCubit
            .get(context)
            .userDataSetting
            ?.userName ?? '';
    emailController.text =
        SettingCubit
            .get(context)
            .userDataSetting
            ?.userEmail ?? '';
    phoneController.text =
        SettingCubit
            .get(context)
            .userDataSetting
            ?.userPhone ?? '';
    return BlocListener<SettingCubit, SettingState>(
      listener: (context, state) {
        if (state is UpdateUserDataLoading) {
          const Center(child: CustomProgressIndicator());
        }
        if (state is UpdateUserDataSuccess) {
          myDialogInformation(context, content: state.upDate.message??'',
              title: 'نجاح',
              titleButton: 'رجوع',
              onPressedOk: (){
            Navigator.pop(context);
              });
          CacheData.getData(
              key: StringCache
                  .userName) ==
              nameController.text.trim();
          CacheData.getData(
              key: StringCache
                  .userPhone) ==
              phoneController.text.trim();
        }
        if (state is UpdateUserDataFailure) {}
      },
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Text(
                          'تعديل',
                          style: AppStyles.styleSemiBold18
                              .copyWith(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: Form(
                          key: formKeyUpdate,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Align(
                                alignment: Alignment.centerRight,
                                child: MyBoxContainer(
                                  padding: 5,
                                  radius: 8,
                                  color: ColorManager.primary2,
                                  child: Text(
                                    'تعديل البيانات',
                                    style: AppStyles.styleRegular16,
                                  ),
                                ),
                              ),
                              TextFormUpdateInformation(
                                enabled: enabled,
                                controller: nameController,
                                title: 'الاسم :',
                                validator: (value) {
                                  if (value?.trim() == '' ||
                                      value!.isEmpty ||
                                      value.length < 3) {
                                    return 'الاسم';
                                  }
                                  return null;
                                },
                              ),
                              TextFormUpdateInformation(
                                keyboardType: TextInputType.phone,
                                enabled: enabled,
                                controller: phoneController,
                                title: 'جوال :',
                                validator: (value) {
                                  if (value?.trim() == '' ||
                                      value!.isEmpty ||
                                      value.length < 10 ||
                                      value.length > 11) {
                                    return 'رقم الجوال ';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    MediaQuery
                                        .sizeOf(context)
                                        .width / 8,
                                    vertical: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (formKeyUpdate.currentState!
                                                .validate()) {
                                              enabled = false;
                                              SettingCubit.get(context)
                                                  .updateUserDate(
                                                userName:
                                                nameController.text.trim(),
                                                userPhone:
                                                phoneController.text.trim(),
                                                userId: CacheData.getData(
                                                    key: StringCache.userId),

                                              );
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          backgroundColor: enabled
                                              ? Colors.green.shade400
                                              : ColorManager.white,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'حفظ',
                                          style: AppStyles.styleSemiBold18
                                              .copyWith(
                                              color: enabled
                                                  ? Colors.white
                                                  : Colors.black54),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            enabled = true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            disabledBackgroundColor: Colors.red,
                                            enableFeedback: false,
                                            elevation: 5,
                                            backgroundColor: enabled
                                                ? ColorManager.white
                                                : Colors.green.shade400,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(10),
                                                    bottomRight:
                                                    Radius.circular(10)))),
                                        child: Text(
                                          'تعديل',
                                          style: AppStyles.styleSemiBold18
                                              .copyWith(
                                              color: enabled
                                                  ? Colors.black54
                                                  : Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // const DeleteAccountUser()
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              top: -10,
              left: 10,
              child: CircleImageToStack(
                imageAsset: Assets.imagesEditeUser,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
