import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../splash/splash_view.dart';
import '../../cubit/setting_cubit.dart';

class DeleteUserActiveFromSetting extends StatefulWidget {
  const DeleteUserActiveFromSetting({
    super.key,
  });

  @override
  State<DeleteUserActiveFromSetting> createState() =>
      _DeleteUserActiveFromSettingState();
}

class _DeleteUserActiveFromSettingState
    extends State<DeleteUserActiveFromSetting> {
  late GlobalKey<FormState> formKeyDelete;

  @override
  void initState() {
    formKeyDelete = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKeyDelete.currentState?.dispose();
    super.dispose();
  }

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingCubit, SettingState>(
      listener: (context, state) {
        if (state is DeleteUserActiveLoading) {
          const Center(child: CustomProgressIndicator());
        }
        if (state is DeleteUserActiveSuccess) {
          if (state.massageRequestModel.status == AppString.success) {
            CacheData.clearUserItems();

            StringCache.active = false;
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashView(),
                ));
          } else {
            CherryToast.error(
              title: Text(
                state.massageRequestModel.message ?? '',
                style: const TextStyle(color: ColorManager.red),
              ),
            ).show(context);
          }
        }
        if (state is DeleteUserActiveFailure) {
          //

          CherryToast.error(
              title: Text(
                state.errorMessage,
                style: const TextStyle(color: ColorManager.red),
              )).show(context);
        }
      },
      child: AlertDialog(
        elevation: 0,
        backgroundColor: Colors.white,
        content: Form(
          key: formKeyDelete,
          child: TextFormField(
            controller: passwordController,
            maxLines: 1,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ادخل كلمة المرور',
                      style:
                      AppStyles.styleRegular16.copyWith(color: Colors.black38),
                    ),
                  ],
                )),
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (formKeyDelete.currentState!.validate()) {
                  SettingCubit.get(context)
                      .deleteUserActive(
                      userId: SettingCubit.get(context)
                          .userDataSetting
                          ?.userId
                          .toString(),
                      userPassword: passwordController.text)
                      .whenComplete(() => Navigator.pop(context));
                }
              },
              style:
              ElevatedButton.styleFrom(backgroundColor: ColorManager.red),
              child: Text(
                'تأكيد حذف الحساب',
                style: AppStyles.styleRegular16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}