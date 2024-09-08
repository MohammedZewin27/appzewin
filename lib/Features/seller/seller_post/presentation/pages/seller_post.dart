import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../core/api/function.dart';
import '../../../core/const.dart';

import '../../../sing_up_seller/data/models/seller_model.dart';

import '../cubit/analysis_cubit.dart';
import '../cubit/post_seller_cubit.dart';
import '../widgets/seller_post_body.dart';

class SellerPost extends StatelessWidget {
  const SellerPost({super.key, this.sellerData});

  final SellerData? sellerData;

  @override
  Widget build(BuildContext context) {

    PostSellerCubit.get(context)
        .fetchPostOfSeller(sellerId: sellerData?.idHirajSeller ?? 0);

    getPostActive(dataPostToSeller);

    /// get post active /// and get post unActive
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: ColorManager.white.withOpacity(.2),
          ),
          child:const RowPostHeaderBody(),
        ),
        Expanded(child: SellerPostBody(sellerData: sellerData)),
      ],
    );
  }
}

class RowPostHeaderBody extends StatefulWidget {
  const RowPostHeaderBody({super.key});

  @override
  State<RowPostHeaderBody> createState() => _RowPostHeaderBodyState();
}

class _RowPostHeaderBodyState extends State<RowPostHeaderBody> {
   int index =5;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RowPostHeader(
            icon: Icons.arrow_drop_down,
            text: 'اقل تقيم',
            color:index==1?ColorManager.blue:Colors.white,
            onTap: () {
              setState(() {
                index=1;
                AnalysisCubit.get(context).lowestRating();
              });

            },
          ),
          RowPostHeader(
              icon: Icons.arrow_drop_up_outlined,
              text: 'اعلي تقيم',

              color:index==2?ColorManager.blue:Colors.white,
              onTap: () {
                setState(() {
                  index=2;

                  AnalysisCubit.get(context).highestRating();
                });

              }),
          RowPostHeader(
              icon: Icons.close
             ,
              text: 'منتج غير نشط',
              color:index==3?ColorManager.blue:Colors.white,
              onTap: () {
                setState(() {
                  index=3;
                  AnalysisCubit.get(context).postUnActive();
                });

              }),
          RowPostHeader(
              icon: Icons.done,
              text: 'منتج نشط',
              color:index==4?ColorManager.blue:Colors.white,
              onTap: () {
                setState(() {
                  index=4;
                  AnalysisCubit.get(context).postActive();
                });

              }),
          RowPostHeader(
              icon: Icons.select_all_outlined,
              text: 'كافة المنتجات',
              color:index==5?ColorManager.blue:Colors.white,
              onTap: () {
                setState(() {
                  index=5;
                  AnalysisCubit.get(context).allDataPost();
                });

              }),
        ],
      ),
    );
  }
}



class RowPostHeader extends StatelessWidget {
  const RowPostHeader(
      {super.key, required this.icon, required this.text, this.onTap,  this.color});

  final IconData icon;
  final String text;

  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const SizedBox(
            height: 20,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.black54,
            ),
          ),
          Row(
            children: [
              Icon(
                icon,
                size: 15,
                color: color??Colors.white,
              ),
              SizedBox(width: 3,),
              AutoSizeText(text,style: AppStyles.styleSemiBold12.copyWith(
                color:color??Colors.white
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
