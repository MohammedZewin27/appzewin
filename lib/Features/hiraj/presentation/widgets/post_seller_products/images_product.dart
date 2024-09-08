import 'package:flutter/cupertino.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../data/models/hiraj_model.dart';
import 'images_view_post_seller.dart';

class ImagesProduct extends StatelessWidget {
  const ImagesProduct({
    super.key,
    required this.productImagesData,
    required this.titleProduct,
  });

  final String titleProduct;
  final List<ProductImages> productImagesData;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: ListView.builder(
            itemCount: productImagesData.length,
            reverse: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoDialogRoute(
                          builder: (context) => ImagesViewPostSeller(
                              indexPage: index,
                              productImagesData: productImagesData),
                          context: context));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: CachedImage(
                        url: productImagesData[index].productImage ?? ''),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ]);
  }
}


