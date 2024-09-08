
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/verify_code_view_reset_password_body.dart';
import '../../../../../core/utils/function/call_me.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/widgets/log_name_and_logo.dart';
import '../../../../../generated/assets.dart';
import '../../../../parent/data/models/parent_model.dart';

class VerifyCodeViewResetPassword extends StatelessWidget {
  const VerifyCodeViewResetPassword({
    super.key,
    required this.email,
    required this.dataParent,
  });

  final String email;

  final DataParent dataParent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary5,
      // resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () async {
          await callMe(context);
        },
        child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(Assets.assetsCallus),
            )),
      ),
      bottomSheet: BottomSheet(
        enableDrag: false,
        onClosing: () {},
        builder: (context) {
          return Container(
              padding: const EdgeInsets.only(top: 20, left: 5, right: 16),
              alignment: Alignment.topLeft,
              height: MediaQuery.sizeOf(context).width * 1.3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: VerifyCodeViewResetPasswordBody(
                email: email,
                dataParent: dataParent,
              ));
        },
      ),
      body: const SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              LogNameAndLogo()

            ],
          ),
        ),
      ),
    );
  }
}
