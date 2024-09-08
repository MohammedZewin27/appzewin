import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../generated/assets.dart';
import 'custom_progress_indicator.dart';

class CustomRefreshIndicatorPage extends StatelessWidget {
  const CustomRefreshIndicatorPage({
    super.key,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height:MediaQuery.sizeOf(context).width/2,),
            Center(
              child: Opacity(
                  opacity: .06,
                  child: Image.asset(
                    Assets.imagesLogo,
                    width: 100,
                    height: 100,
                  )),
            ),
            Opacity(
              opacity: .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppString.appNamePremiere,
                      style: AppStyles.styleSemiBoldQahiri60
                          .copyWith(
                          color: ColorManager.primary7,
                          fontSize: 16
                      )),
                  Text(AppString.appNameMaster,
                      style: AppStyles.styleSemiBoldQahiri60
                          .copyWith(
                          color: ColorManager.primary7,
                        fontSize: 50
                      )),
                ],
              ),
            ),
            const SizedBox(height: 35,),
            const Center(child: CustomProgressIndicator()),
            SizedBox(height:MediaQuery.sizeOf(context).width/2,),
          ],
        ));
  }
}

// Scaffold(
// appBar: AppBar(),
// body: Shimmer.fromColors(
// baseColor: Colors.black38,
// highlightColor: Colors.black12,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Row(
// children: [
// Expanded(
// flex: 4,
// child: Container(
// decoration: BoxDecoration(
// color: Colors.black38,
// borderRadius: BorderRadius.circular(12)),
// height: 40,
// // width: 70,
// ),
// ),
// Container(
// decoration: BoxDecoration(
// color: Colors.white,
// ),
// width: 10,
// // width: 120,
// ),
// Icon(Icons.favorite,size: 30,color:Colors.black38 ,)
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.black38,
// borderRadius: BorderRadius.circular(5)),
// height: 90,
// width: 30,
//
// ),
// const SizedBox(
// width: 20,
// ),
// Expanded(
// child: Container(
// decoration: BoxDecoration(
// color: Colors.black38,
// borderRadius: BorderRadius.circular(5)),
// height: 130,
//
// ),
// ),
// const SizedBox(
// width: 20,
// ),
// Container(
// decoration: BoxDecoration(
// color: Colors.black38,
// borderRadius: BorderRadius.circular(5)),
// height: 90,
// width: 30,
//
// ),
// ],
// ),
// const SizedBox(
// height: 10,
// ),
// Row(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.black38,
// borderRadius: BorderRadius.circular(12)),
// height: 25,
// width: 50,
// ),
// Expanded(
// child: SizedBox(
//
// ),
// ),
// Container(
// decoration: BoxDecoration(
// color: Colors.black38,
// borderRadius: BorderRadius.circular(12)),
// height: 25,
// width: 35,
// ),
// ],
// ),
// Container(
// height: 70,
// child: ListView.separated(
// itemCount: 10,
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// scrollDirection: Axis.horizontal,
// itemBuilder: (context, index) {
// return   Container(
// decoration: BoxDecoration(
// color: Colors.black38,
// borderRadius: BorderRadius.circular(12)),
// height: 60,
// width: 60,
// );
// }, separatorBuilder: (BuildContext context, int index) {
// return SizedBox(height: 10,width: 50,);
// },),
// ),
//
//
// ],
// ),
// ),
// ),
// )
