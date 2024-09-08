import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../parent/data/models/parent_model.dart';


class ButtonLogIn extends StatelessWidget {
  const ButtonLogIn({
    super.key, required this.onPressed, this.color,
  });
final void Function() onPressed;
final Color? color;
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 2,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    backgroundColor:color?? ColorManager.primary),
                onPressed:onPressed,
                child: Text(
                  'تسجيل دخول',
                  style: AppStyles.styleSemiBold16.copyWith(color: Colors.white),
                ),
              ),
            ),
            const Expanded(child: SizedBox())
          ],
        ));
  }
}

class ButtonLogUp extends StatelessWidget {
  const ButtonLogUp({
    super.key,
    required this.dataParent, this.onPressed,
  });

  final DataParent dataParent;
  final void Function()?  onPressed;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary),
              onPressed: onPressed,
              child: Text(
                'تسجيل ',
                style: AppStyles.styleMedium16.copyWith(color: Colors.white),
              )
            ),
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}


