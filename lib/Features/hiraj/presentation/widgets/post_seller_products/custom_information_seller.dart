import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/function/call_me.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../../../core/utils/responsive size/responsive_size.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_rating.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../data/models/hiraj_model.dart';
import '../../cubit/hiraj_cubit.dart';


class CustomInformationSeller extends StatelessWidget {
  const CustomInformationSeller({
    super.key,
    required this.hirajSellerData,
  });

  final HirajSellerData hirajSellerData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            height: getResponsiveSize(context, size: 5),
            width: getResponsiveSize(context, size: 60),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
        GestureDetector(
          onTap: () {
            CacheData.getData(key: StringCache.userId) != 0?   Navigator.push(
                context,
                ModalBottomSheetRoute(
                    builder: (context) {
                      return CustomAddRatingSeller(
                        name: hirajSellerData.nameHirajSelle ?? '', hirajSellerData: hirajSellerData,
                      );
                    },
                    isScrollControlled: true)):registerNow(context);
          },
          child: Row(
            children: [
              CustomRating(
                rating: double.parse(hirajSellerData.ratingSeller.toString()),
                ignoreGestures: true,
                itemSize: getResponsiveSize(context, size: 14),
              ),
              Text(
                '( ',
                style: AppStyles.styleRegular14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
              ),
              Text(
                '${hirajSellerData.ratingSeller}',
                style: AppStyles.styleRegular14
                    .copyWith(color: Colors.blue, fontWeight: FontWeight.w900),
              ),
              Text(
                '/ 5 )',
                style: AppStyles.styleRegular14
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomAddRatingSeller extends StatefulWidget {
  const CustomAddRatingSeller({
    super.key, required this.name, required this.hirajSellerData,
  });

  final String name;
  final HirajSellerData hirajSellerData;
  @override
  State<CustomAddRatingSeller> createState() => _CustomAddRatingSellerState();
}

class _CustomAddRatingSellerState extends State<CustomAddRatingSeller> {
  double rating = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
            child: Container(
              height: getResponsiveSize(context, size: 6),
              width: getResponsiveSize(context, size: 60),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.name,
            style: AppStyles.styleRegular16,
          ),
        ),

        SizedBox(
          height: getResponsiveSize(context, size: 15),
        ),
        MyBoxContainer(
          radius: 15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '( $rating / 5 )',
              style: AppStyles.styleSemiBold20
                  .copyWith(color: Colors.blue, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        SizedBox(
          height: getResponsiveSize(context, size: 15),
        ),
        CustomRating(
          rating: rating,
          itemSize: 50,
          ignoreGestures: false,
          onRatingUpdate: (numRating) {
            setState(() {
              rating = numRating;
            });
          },
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: getResponsiveSize(context, size: 100),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            width: MediaQuery
                .sizeOf(context)
                .width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary),
              onPressed: () {
                HirajCubit.get(context).ratingSeller(userid: CacheData.getData(key: StringCache.userId),
                    sellerId: widget.hirajSellerData.idHirajSeller!,
                    ratingValue: rating);
                Navigator.pop(context);
              },
              child: const Text(
                'تقيمك',
                style: AppStyles.styleSemiBold18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}