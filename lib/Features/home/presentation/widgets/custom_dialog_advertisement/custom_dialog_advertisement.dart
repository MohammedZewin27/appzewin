import 'package:flutter/material.dart';


import '../../../../../core/variable.dart';
import 'dialog_content_advertisement.dart';

class CustomDialogAdvertisement extends StatelessWidget {
  const CustomDialogAdvertisement({super.key});

  @override
  Widget build(BuildContext context) {

    return dataDialogAdvertisement.isNotEmpty?Dialog(

         shape: RoundedRectangleBorder(

           borderRadius: BorderRadius.circular(16),
         ),
         elevation: 0.0,
         backgroundColor: Colors.transparent,
         child:  DialogContentAdvertisement(dialogAdvertisementData: dataDialogAdvertisement[0],),
       ): const SizedBox.shrink();



  }
}