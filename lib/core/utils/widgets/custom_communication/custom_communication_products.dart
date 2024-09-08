import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Features/analysis/presentation/cubit/app_analysis_cubit.dart';
import '../../responsive size/responsive_size.dart';
import 'Communication_model.dart';
import 'custom_icon_favorite_products.dart';
import '../launch_url.dart';
import '../my_box_container.dart';

class CustomCommunicationProductsHome extends StatelessWidget {
  const CustomCommunicationProductsHome({
    super.key,
    required this.communicationModel,
    this.size, required this.idProduct, this.showFavorite=true, required this.isFavorite, required this.idSeller,
  });

  final CommunicationModel communicationModel;
  final double? size;
  final int idProduct;
  final int idSeller;
  final bool isFavorite;
  final bool? showFavorite;



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
                cubitAnalysis.analysisWhatsAppProduct(idProduct: idProduct,idSeller:idSeller );
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
                cubitAnalysis.analysisSharingProduct(idProduct: idProduct,idSeller:idSeller );
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
                cubitAnalysis.analysisCallProduct(idProduct: idProduct,idSeller:idSeller );
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
                cubitAnalysis.analysisLocationProduct(idProduct: idProduct,idSeller:idSeller );
                communicationModel.location
                    .contains('https://maps.app.goo.gl')||communicationModel.location
                    .contains('https://www.google.com/maps')
                ||communicationModel.location
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
          showFavorite==true?CustomIconFavoriteProductsHome(productId:idProduct ,):const SizedBox()
        ],
      ),
    );
  }
}