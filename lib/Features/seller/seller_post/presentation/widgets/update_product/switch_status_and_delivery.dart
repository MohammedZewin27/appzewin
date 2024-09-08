import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';

import '../../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../../core/utils/widgets/custom_rating.dart';
import '../../../data/models/post_seller_model.dart';
import '../../cubit/post_seller_cubit.dart';

class SwitchStatusAndDelivery extends StatefulWidget {
  const SwitchStatusAndDelivery({super.key, required this.dataPost});

  final ProductsSeller dataPost;

  @override
  State<SwitchStatusAndDelivery> createState() =>
      _SwitchStatusAndDeliveryState();
}

class _SwitchStatusAndDeliveryState extends State<SwitchStatusAndDelivery> {
  late bool statusProduct;

  late bool isDeliveryService;

  late String status;
  late String delivery;
  late String deliveryService;

  @override
  void initState() {
    statusProduct = widget.dataPost.statusProduct == 1;
    isDeliveryService = widget.dataPost.deliveryService == 1;
    statusValue(statusProduct);
    deliveryValue(isDeliveryService);
    super.initState();
  }

  void statusValue(bool value) {
    if (value) {
      status = '1';
    } else {
      status = '0';
    }
  }

  void deliveryValue(bool value) {
    if (value) {
      delivery = '1';
    } else {
      delivery = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = PostSellerCubit.get(context);
    cubit.statusProduct = status;
    cubit.deliveryService = delivery;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 30,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      value: statusProduct,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          statusProduct = value;
                          cubit.checkStatusProduct(value);
                          status = value ? '1' : '0';
                          print(value);
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                statusProduct? Text(
                  'نشط',
                  style: AppStyles.styleBoldPrimary16.copyWith(
                      color: Colors.green
                  ),
                ):Text(
                  'غير نشط',
                  style: AppStyles.styleBoldPrimary16.copyWith(
                    color: ColorManager.backBlack.withOpacity(.47)
                  ),
                )

                ,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 35,
                  height: 30,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      value: isDeliveryService,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          isDeliveryService = value;
                          cubit.checkDeliveryService(value);
                          delivery = value ? '1' : '0';
                          print(value);
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'خدمة التوصيل',
                  style: AppStyles.styleBoldPrimary16,
                ),
              ],
            ),
          ],
        ),

      ],
    );
  }
}