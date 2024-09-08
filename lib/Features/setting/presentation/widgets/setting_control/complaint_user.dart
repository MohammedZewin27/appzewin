import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/function/functions.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../generated/assets.dart';
import '../../cubit/setting_cubit.dart';
import '../text_form_update_information.dart';
import 'circle_image_stack.dart';

class ComplaintUser extends StatefulWidget {
  const ComplaintUser({super.key});

  @override
  State<ComplaintUser> createState() => _ComplaintUserState();
}

class _ComplaintUserState extends State<ComplaintUser> {
  late GlobalKey<FormState> formKeyComplaint;

  @override
  void initState() {
    formKeyComplaint = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKeyComplaint.currentState?.dispose();
    super.dispose();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController textController = TextEditingController();
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    nameController.text =
        SettingCubit.get(context).userDataSetting?.userName ?? '';
    emailController.text =
        SettingCubit.get(context).userDataSetting?.userEmail ?? '';
    phoneController.text =
        SettingCubit.get(context).userDataSetting?.userPhone ?? '';
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocListener<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state is ServiceRequestDataSuccess) {

            myDialogInformation(context, content: state.serviceRequestModel.message ?? '',
                image:Assets.imagesSuccess,
                title: ' الشكوى',
                titleButton: 'رجوع',
                onPressedOk: (){
                  Navigator.pop(context);
                });
          }
          if (state is ServiceRequestDataFailure) {
            myDialog(context, content: state.errorMessage ?? '',
                title: 'فشل في الارسال',
                titleButton: 'حاول مرة ',
                onPressedOk: () {
                  Navigator.pop(context);
                },
                onPressedCancel: () {
                  Navigator.pop(context);
                });
          }
        },
  child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 10,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKeyComplaint,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormUpdateInformation(
                          enabled: false,
                          controller: nameController,
                          title: 'الاسم :',
                          validator: (value) {
                            if (value?.trim() == '' || value!.isEmpty) {
                              return 'الاسم';
                            }
                            return null;
                          },
                        ),

                        TextFormUpdateInformation(
                          keyboardType: TextInputType.phone,
                          enabled: false,
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

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'موضوع الشكوى',
                            style: AppStyles.styleRegular16,
                          ),
                        ),
                        TextFormField(
                          maxLines: 5,
                          maxLength: 150,
                          controller: textController ,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: ColorManager.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: ColorManager.primary)),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKeyComplaint.currentState!
                                        .validate()) {
                                      SettingCubit.get(context)
                                          .serviceRequest(
                                        email: emailController.text,
                                          phone:phoneController.text ,
                                          text: textController.text);
                                    }
                                    
                                    
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 8,
                                      backgroundColor: Colors.green.shade400,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: Text(
                                    'ارسال',
                                    style: AppStyles.styleRegular16
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'ملحوظة سوف يتم ارسال الرسالة متضمنة الاسم ورقم الجوال ',
                            style: AppStyles.styleSemiBold10,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // const DeleteAccountUser()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: -10,
            left: 10,
            child: CircleImageToStack(
              imageAsset: Assets.imagesComplaints,
            ),
          ),
        ],
      ),
),
    );
  }
}
