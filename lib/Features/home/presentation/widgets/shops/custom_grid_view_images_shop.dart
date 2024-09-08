import 'package:flutter/material.dart';


import '../../../../../core/utils/theme/strings_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../data/models/home_model.dart';
import 'images_view.dart';

class CustomGridViewImagesShop extends StatelessWidget {
  const CustomGridViewImagesShop({
    super.key,
    required this.shopsData,
  });

  final ShopsData shopsData;

  @override
  Widget build(BuildContext context) {
    return shopsData.shopImages?.status == AppString.success?Column(
      children: [

        const SizedBox(height: 10,),
        const Divider(),
        Text(
          ' صور',
          style: AppStyles.styleSemiBold16.copyWith(color: Colors.blue[800]),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          // reverse: true,
          physics: const BouncingScrollPhysics(),

          // scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 7 / 4.7,

              // mainAxisExtent: 150,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: shopsData.shopImages?.imagesData?.length,
          itemBuilder: (context, index) => MyBoxContainer(
            radius: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {

                    return
                      ImagesView(
                        indexPage: index,
                        imagesData: shopsData.shopImages!.imagesData!);
                  },
                ));
              },
              child: Hero(
                tag:'ImagesViewShop${shopsData
                    .shopImages?.imagesData?[index].shopImageId}' ,
                child: CachedImage(
                    url: shopsData
                        .shopImages?.imagesData?[index].shopImageUrl ??
                        ''),
              ),
            ),
          ),
        ),
      ],
    ):const SizedBox();
  }
}
