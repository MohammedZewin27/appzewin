import 'package:cherry_toast/cherry_toast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/auth/presentation/views/widget/verify_code.dart';
import 'package:sahel_net/Features/shop_controller/UpdateShop/presentation/cubit/up_date_shop_cubit.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../core_shop/const/const_shop.dart';

class AddMoreServicesShop extends StatefulWidget {
  const AddMoreServicesShop({super.key});

  @override
  State<AddMoreServicesShop> createState() => _AddMoreServicesShopState();
}

class _AddMoreServicesShopState extends State<AddMoreServicesShop> {
  @override
  Widget build(BuildContext context) {
    var cubit = UpDateShopCubit.get(context);
    List<String> addServices = cubit.addServices;
    return SizedBox(
      height: MediaQuery.sizeOf(context).width / 7,
      child: ListView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        children: [
          InkWell(
            onTap: () {
              if (cubit.addServices.length + moreServicesShop.length < 10) {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    actions: [
                      CupertinoButton(
                          child: Text(
                            'الغاء',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.redAccent),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      CupertinoButton(
                          child: const Text('اضافة'),
                          onPressed: () {
                            setState(() {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.addServices
                                    .add(cubit.servicesController.text);
                                cubit.servicesController.clear();
                                Navigator.pop(context);
                              }
                            });
                          }),
                    ],
                    title: Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          const Text('اضافة خدمة'),
                          CupertinoTextFormFieldRow(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الحقل فارغ.';
                              }
                              if (value.length < 4) {
                                return 'الحد الادني 4 حروف';
                              }
                              if (value.length > 21) {
                                return 'الحد الاقصي 20 حروف';
                              }
                              return null;
                            },
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            controller: cubit.servicesController,
                            textDirection: TextDirection.rtl,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                CherryToast.warning(
                  title: const Text('الحد الاقصى 10 خدمات فقط'),
                ).show(context);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManager.lightOrange),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          addServices.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).width / 7,
                  child: ListView.builder(
                    itemCount: addServices.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Card(
                                elevation: 4,
                                color: Colors.orange,
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  height: double.infinity,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            cubit.addServices[index],
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -15,
                              left: -15,
                              child: IconButton(
                                
                                onPressed: () {
                                  setState(() {
                                    cubit.addServices.removeAt(index);
                                  });
                                },
                                icon: MyBoxContainer(

                                  child: const Icon(
                                    Icons.highlight_remove,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
          moreServicesShop.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.sizeOf(context).width / 7,
                  child: ListView.builder(
                    itemCount: moreServicesShop.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // reverse: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Card(
                                // elevation: 4,
                                color: ColorManager.primary7,
                                clipBehavior: Clip.antiAlias,
                                child: Container(

                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  height: double.infinity,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            moreServicesShop[index].shopServices ??
                                                '',
                                            style: AppStyles.styleRegular15.copyWith(
                                              fontSize: 10,
                                              color: Colors.white
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -15,
                              left: -15,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    UpDateShopCubit.get(context)
                                        .deleteServicesShop(
                                            servicesId: moreServicesShop[index]
                                                    .servicesId ??
                                                0);
                                    moreServicesShop.removeAt(index);
                                  });
                                },
                                icon: MyBoxContainer(

                                  child: const Icon(
                                    Icons.highlight_remove,
                                    color: Colors.red,
                                    size: 15,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

// class AddServicesDialog extends StatelessWidget {
//   const AddServicesDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = UpDateShopCubit.get(context);
//     TextEditingController services = TextEditingController();
//     return CupertinoAlertDialog(
//       actions: [
//         CupertinoButton(
//             child: Text(
//               'الغاء',
//               style: Theme.of(context)
//                   .textTheme
//                   .titleMedium!
//                   .copyWith(color: Colors.redAccent),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         CupertinoButton(
//             child: const Text('اضافة'),
//             onPressed: () {
//               cubit.addServices.add(services.text);
//             }),
//       ],
//       title: Form(
//         // key: cubit.formKey2,
//         child: Column(
//           children: [
//             const Text('اضافة خدمة'),
//             CupertinoTextFormFieldRow(
//               validator: (value) {
//                 if (value!.isEmpty || value.length < 4) {
//                   return 'Please enter a valid service.';
//                 }
//                 return null;
//               },
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   color: Colors.black12,
//                 ),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               controller: services,
//               textDirection: TextDirection.rtl,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
