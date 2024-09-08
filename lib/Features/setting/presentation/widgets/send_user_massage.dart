import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../generated/assets.dart';
import '../cubit/cubit_send_massage/send_massage_cubit.dart';
import '../cubit/setting_cubit.dart';

class SendUserMassage extends StatefulWidget {
  const SendUserMassage({
    super.key,
    required this.type,
  });

  final String type;

  @override
  State<SendUserMassage> createState() => _SendUserMassageState();
}

class _SendUserMassageState extends State<SendUserMassage> {
  late GlobalKey<FormState> formKeySendMassage;

  @override
  void initState() {
    formKeySendMassage = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKeySendMassage.currentState?.dispose();
    super.dispose();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendMassageCubit, SendMassageState>(
      listener: (context, state) {
        if (state is AddUserMassageLoading) {
          const Center(child: CustomProgressIndicator());
        }
        if (state is AddUserMassageSuccess) {
          if (state.massageRequestModel.status == AppString.success) {
            CherryToast.success(
                title: const Text('نجاج'),
                action: Text(
                  state.massageRequestModel.message ?? '',
                )).show(context);
            titleController.clear();
            subjectController.clear();
          } else {
            CherryToast.error(
                title: const Text('فشل'),
                action: Text(
                  state.massageRequestModel.message ?? '',
                )).show(context);
          }
        }
        if (state is AddUserMassageFailure) {
          CherryToast.error(
            title: const Text('فشل'),
            action: Text(
              state.errorMessage,
            ),
          ).show(context);
        }
      },
      child: Scaffold(
        backgroundColor:
        widget.type == '1' ? ColorManager.primary5 : ColorManager.primary7,
        body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).width * .4,
                        width: MediaQuery.sizeOf(context).width * .4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(
                              height: MediaQuery.sizeOf(context).width * .20,
                              width: MediaQuery.sizeOf(context).width * .20,
                              child: Image.asset(
                                Assets.imagesLogo,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppString.appNamePremiere,
                                  style: AppStyles.styleSemiBoldQahiri6.copyWith(
                                      color:Colors.white,
                                      fontSize: 15
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  AppString.appNameMaster,
                                  style: AppStyles.styleSemiBoldQahiri3
                                      .copyWith(color: Colors.white,fontSize: 25),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        widget.type == '1'
                            ? 'قم بكتابة مقترحاتك هنا وسوف يتم معالجتها '
                            : 'قم بكتابة الشكوى هنا وسوف يتم معالجتها',
                        style: AppStyles.styleBold14.copyWith(
                            color: widget.type == '1'
                                ? Colors.white
                                : ColorManager.white),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).width * .5),
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 5),
                              child: Form(
                                key: formKeySendMassage,
                                child: Column(
                                  children: [
                                    Text(
                                      widget.type == '1'
                                          ? 'تقديم مقترح'
                                          : 'تقديم شكوى',
                                      style: AppStyles.styleSemiBold18
                                          .copyWith(color: ColorManager.primary7),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Material(
                                            elevation: 20.0,
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(13)),
                                            shadowColor: ColorManager.primary6,
                                            child: TextFormField(
                                              controller: titleController,
                                              textDirection: TextDirection.rtl,
                                              validator: (value) {
                                                if (value!.trim() == '' ||
                                                    value.isEmpty) {
                                                  return widget.type == '1'
                                                      ? " * عنوان الرسالة فارغ"
                                                      : " * عنوان الشكوى فارغ";
                                                }
                                                if (value.trim().length < 6) {
                                                  return widget.type == '1'
                                                      ? "* عنوان الرسالة يجب ان يكون اكبر من 6 أحروف"
                                                      : "* عنوان الشكوى يجب ان يكون اكبر من 6 أحروف";
                                                }
                                                return null;
                                              },
                                              textInputAction: TextInputAction.next,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(16),
                                                      borderSide: const BorderSide(
                                                          color:
                                                          Colors.transparent)),
                                                  errorBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      borderSide: const BorderSide(
                                                          color:
                                                          Colors.transparent)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      borderSide: const BorderSide(
                                                          color:
                                                          Colors.transparent)),
                                                  filled: true,
                                                  fillColor: ColorManager.white),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          widget.type == '1'
                                              ? 'عنوان الرسالة'
                                              : 'عنوان الشكوى',
                                          style: AppStyles.styleSemiBold16.copyWith(
                                              color: ColorManager.primary),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          widget.type == '1'
                                              ? 'موضوع الرسالة'
                                              : 'موضوع الشكوى',
                                          style: AppStyles.styleSemiBold16.copyWith(
                                              color: ColorManager.primary),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Material(
                                          elevation: 20.0,
                                          shadowColor: ColorManager.primary6,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(13)),
                                          child: TextFormField(
                                            controller: subjectController,
                                            textDirection: TextDirection.rtl,
                                            maxLines: 12,
                                            maxLength: 500,
                                            validator: (value) {
                                              if (value!.trim() == '' ||
                                                  value.isEmpty) {
                                                return widget.type == '1'
                                                    ? " * موضوع الرسالة فارغ"
                                                    : " * موضوع الشكوى فارغ";
                                              }
                                              if (value.trim().length < 30) {
                                                return widget.type == '1'
                                                    ? "* موضوع الرسالة يجب ان يكون اكبر من 30 حروف"
                                                    : "* موضوع الشكوى يجب ان يكون اكبر من 30 حروف";
                                              }
                                              return null;
                                            },
                                            textInputAction: TextInputAction.next,
                                            style: const TextStyle(
                                                color: Colors.black87),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(16),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide: const BorderSide(
                                                      color: Colors.transparent)),
                                              filled: true,
                                              fillColor: ColorManager.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context).width *
                                              .04,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                              MediaQuery.sizeOf(context).width /
                                                  6),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: widget.type == '1'
                                                    ? ColorManager.primary
                                                    : ColorManager.primary7),
                                            onPressed: () {
                                              if (formKeySendMassage.currentState!
                                                  .validate()) {
                                                SendMassageCubit.get(context)
                                                    .sendUserMassage(
                                                    userId: SettingCubit.get(
                                                        context)
                                                        .userDataSetting
                                                        ?.userId
                                                        .toString() ??
                                                        '143',
                                                    title: titleController.text,
                                                    subject:
                                                    subjectController.text,
                                                    type: widget.type);
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Transform.rotate(
                                                  angle: 3.14159265,
                                                  child: const Icon(
                                                    Icons.send,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  'ارسال',
                                                  style: AppStyles.styleSemiBold16
                                                      .copyWith(
                                                      color: Colors.white),
                                                ),
                                                const Spacer(),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context).width *
                                              .11,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      right: 25,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          widget.type == '1'
                              ? Assets.imagesSuggestions
                              : Assets.imagesComplaints,
                          width: 25,
                          height: 25,
                        ),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}