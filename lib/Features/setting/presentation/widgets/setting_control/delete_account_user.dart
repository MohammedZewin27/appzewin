import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';

class DeleteAccountUser extends StatefulWidget {
  const DeleteAccountUser({
    super.key,
  });

  @override
  State<DeleteAccountUser> createState() => _DeleteAccountUserState();
}

class _DeleteAccountUserState extends State<DeleteAccountUser> {
  late GlobalKey<FormState> formKeyDelete;

  @override
  void initState() {
    formKeyDelete = GlobalKey<FormState>();
    super.initState();
  }

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    formKeyDelete.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyDelete,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    content: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 40,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'تحذير  ',
                                textAlign: TextAlign.center,
                                style: AppStyles.styleSemiBold18
                                    .copyWith(color: ColorManager.primary),
                              ),
                              Text(
                                'سوف يتم حذف كافة البيانات من قاعدة البيانات وايضا'
                                    ' جميع ما هو داخل المفضلة ولا يمكن استرجاعه مره اخري',
                                textAlign: TextAlign.center,
                                style: AppStyles.styleBold16.copyWith(
                                    color: ColorManager.black.withOpacity(.6)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                controller: passwordController,
                                validator: (value) {
                                  if (value?.trim() == '' ||
                                      value!.isEmpty ||
                                      value.length < 6) {
                                    return 'كلمة المرور';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  label: Center(
                                    child: Text('ادخل كلمة المرور'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(16)),
                                          backgroundColor: ColorManager.grey),
                                      child: AutoSizeText(
                                        'الغاء',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppStyles.styleRegular16
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(16)),
                                          backgroundColor:
                                          ColorManager.primary4),
                                      child: const AutoSizeText(
                                        'تاكيد',
                                        maxLines: 1,
                                        overflow: TextOverflow.visible,
                                        style: AppStyles.styleRegular16,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Positioned(
                          top: -80,
                          right: 0,
                          left: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 52,
                            child: Icon(
                              Icons.error,
                              color: Colors.redAccent,
                              size: 100,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: const Text('اضغط هنا')),
          const Text('اذا كنت تريد ازالة الحساب نهائيا من التطبيق'),
        ],
      ),
    );
  }
}