import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../Layout/data/models/dialog_advertisement_model.dart';

class DialogContentAdvertisement extends StatelessWidget {
  const DialogContentAdvertisement({super.key, required this.dialogAdvertisementData,});
final DialogadvertisementData dialogAdvertisementData;
  @override
  Widget build(BuildContext context) {

    return FittedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: .8,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                              ),
                              child:  CachedImage(
                                        url:
                                        dialogAdvertisementData.imageDialogAdvertisement??'',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,)
                      ],
                    ),
                    Positioned(
                      top: -15,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle
                          ),
                          child: const Icon(FontAwesomeIcons.xmark,size: 25,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                   Expanded(
                    child: Center(
                      child: Text(
                        dialogAdvertisementData.titleDialogAdvertisement??'',
                        style: AppStyles.styleSemiBold16.copyWith(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
      
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

