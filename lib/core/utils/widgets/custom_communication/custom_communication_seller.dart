

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/analysis/presentation/cubit/app_analysis_cubit.dart';
import 'package:sahel_net/core/utils/widgets/custom_communication/custom_icon_favorite_seller.dart';

import '../../responsive size/responsive_size.dart';
import '../launch_url.dart';
import '../my_box_container.dart';
import 'Communication_model.dart';

class CustomCommunicationSeller extends StatelessWidget {
  const CustomCommunicationSeller({
    super.key,
    required this.communicationModel,
    this.size, required this.sellerId,  this.isFavorite, this.showFavorite=true,
  });

  final CommunicationModel communicationModel;
  final double? size;

  final bool? isFavorite;
  final bool? showFavorite;
  final int sellerId;

  @override
  Widget build(BuildContext context) {
    var cubitAnalysis=  AppAnalysisCubit.get(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyBoxContainer(
            child: IconButton(
              onPressed: () {
                cubitAnalysis.analysisWhatsAppSeller(idSeller: sellerId);
                CustomLaunchUrl.launchUrlWhatsapp(
                    numPhone: communicationModel.phone,
                    name: communicationModel.title ?? '',
                    urlPreview: communicationModel.urlImage ?? '');
              },
              icon: Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
                size: getResponsiveSize(context, size: size??20),
              ),
            ),
          ),
          MyBoxContainer(
            child: IconButton(
              onPressed: () {
                cubitAnalysis.analysisSharingSeller(idSeller: sellerId);
                CherryToast.success(

                  title:  const Text("مشاركة", style: TextStyle(color: Colors.black)),

                  action: const Text("انتظر قليلا", style: TextStyle(color: Colors.black)),

                  actionHandler: (){

                    print("Action button pressed");

                  },

                ).show(context);
                CustomLaunchUrl.launchUrlShare(
                  details: communicationModel.details,
                  title: communicationModel.title,
                  urlPreview: communicationModel.urlImage,
                  phone: communicationModel.phone,
                );
              },
              icon: Icon(
                FontAwesomeIcons.shareNodes,
                color: Colors.green,
                size: getResponsiveSize(context, size: size??20),
              ),
            ),
          ),
          MyBoxContainer(
            child: IconButton(
              onPressed: () {
                cubitAnalysis.analysisCallSeller(idSeller: sellerId);
                communicationModel.phone==''?CherryToast.error(

                  title:  const Text("الاتصال", style: TextStyle(color: Colors.black)),

                  action: const Text("رقم الجوال غير متاح ", style: TextStyle(color: Colors.black)),

                  actionHandler: (){

                    print("Action button pressed");

                  },

                ).show(context): CustomLaunchUrl.launchUrlCall(
                    numPhone: communicationModel.phone);
              },
              icon: Icon(
                FontAwesomeIcons.phone,
                color: Colors.blue,
                size: getResponsiveSize(context, size: size??20),
              ),
            ),
          ),
          MyBoxContainer(
            child: IconButton(
              onPressed: () {
                cubitAnalysis.analysisLocationSeller(idSeller: sellerId);
                communicationModel.location
                    .contains('https://maps.app.goo.gl')||communicationModel.location
                    .contains('https://www.google.com/maps') ||communicationModel.location
                    .contains('google.navigation')==
                    true

                    ? CustomLaunchUrl.launchUrlLocation(
                    location: communicationModel.location ?? '')
                    : CherryToast.error(

                  title:  const Text("الموقع", style: TextStyle(color: Colors.black)),

                  action: const Text("الموقع غير متاح حاليا", style: TextStyle(color: Colors.black)),

                  actionHandler: (){

                    print("Action button pressed");

                  },

                ).show(context);

              },
              icon: Icon(
                FontAwesomeIcons.locationDot,
                color: Colors.red,
                size: getResponsiveSize(context, size: size??20),
              ),
            ),
          ),
          showFavorite==true?CustomIconFavoriteSeller(sellerId:sellerId ,):const SizedBox()

        ],
      ),
    );
  }
}