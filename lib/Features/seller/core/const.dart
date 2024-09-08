import 'package:flutter/material.dart';
import 'package:sahel_net/generated/assets.dart';


import '../home_seller/presentation/pages/seller_home.dart';
import '../seller_analysis/presentation/pages/seller_analysis.dart';
import '../seller_post/data/models/post_seller_model.dart';
import '../seller_post/presentation/pages/seller_post.dart';
import '../seller_setting/presentation/pages/seller_setting.dart';
import '../sing_up_seller/data/models/seller_model.dart';

List<Widget> getSellerPages({SellerData? sellerData}) {
  return [
    SellerSetting(
      sellerData: sellerData,
    ),
    SellerAnalysis(
      sellerData: sellerData,
    ),
    SellerPost(
      sellerData: sellerData,
    ),
    SellerHome(
      sellerData: sellerData,
    ),
  ];
}


SellerData? dataSellerInScreenAddPost;

List<ProductsSeller> dataPostToSeller=[];
List<ProductsSeller> postActive = [];
List<ProductsSeller> postUnActive = [];



List<IconData> iconList = [
  Icons.settings_outlined,
  Icons.search_outlined,
  Icons.add_business_outlined,
  Icons.home_outlined,
];
List<IconData> iconActiveList = [
  Icons.settings,
  Icons.search,
  Icons.add_business_rounded,
  Icons.home,
];
List<String> titleList = [
  'اعدادات',
  'تحليل',
  'المنشورات',
  'الرئيسية',
];

List<String> images = [
  Assets.imagesSettingSeller,
  Assets.imagesAnalysisSeller,
  Assets.imagesPostSeller,
  Assets.imagesHomeSeller,
];

// List<ImagesProductModel> listImages = [];


