import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../../core/utils/widgets/controller_page_view.dart';
import '../../../data/models/home_model.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({super.key, required this.imagesData, required this.indexPage});

  final List<ImagesData> imagesData;
  final int indexPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          PageView.builder(
            controller:MyPageController(index: indexPage) ,

            itemBuilder: (context, index) =>
                Hero(
                    tag:'ImagesViewShop${imagesData[index].shopImageId}' ,
                    child: CachedImage(url: imagesData[index].shopImageUrl ?? '')),
            reverse: true,
            itemCount: imagesData.length,
          ),
          Positioned(
            height: 100,
            right: 5,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                    padding:
                    const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ColorManager.white),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                    ))),
          ),
        ],
      ),
    );
  }
}


