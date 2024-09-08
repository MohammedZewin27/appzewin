

import 'package:flutter/material.dart';
import 'package:sahel_net/Features/shop_controller/information_shop_user/presentation/pages/information_shop_user.dart';
import 'package:sahel_net/Features/shop_controller/UpdateShop/presentation/pages/update_user_shop.dart';
import 'package:sahel_net/Features/shop_controller/setting_user_shop/presentation/pages/setting_user_shop.dart';

import '../../../../generated/assets.dart';
import '../../auth_shop/data/models/add_shop_database.dart';
import '../../information_shop_user/data/models/information_model.dart';

ShopData? shopDataUser;
List<ImagesData> addMoreImages=[];
List<Services> moreServicesShop=[];


List<Widget> getShopPages({ShopData? shopData}) {
  return [

    SettingUserShop(shopData: shopDataUser??shopData),
    UpdateUserShop(shopData: shopDataUser??shopData,),
    InformationShopUser(shopData: shopDataUser??shopData,),

  ];
}
List<String> titleListIconShop = [
  'اعدادت',
  'اضافة',
  'الرئيسية',
];
List<IconData> iconListShop = [
  Icons.settings_outlined,
  Icons.add_business_outlined,
  Icons.home_outlined,
];
List<BottomNavigationBarItem> listItemNavShop=[
  const BottomNavigationBarItem(icon:Icon(Icons.settings_outlined,),activeIcon: Icon(Icons.settings) ,label: 'اعدادت'),
  const BottomNavigationBarItem(icon:Icon( Icons.edit_note,),activeIcon: Icon(  Icons.add_business_rounded,) ,label: 'اضافة'),
  const BottomNavigationBarItem(icon:Icon(Icons.home_outlined,),activeIcon: Icon(  Icons.home,) ,label: 'الرئيسية',),
];

List<IconData> iconActiveListShop = [
  Icons.settings,
  Icons.add_business_rounded,
  Icons.home,
];
List<String> titleShopList = [
  'اعدادت',
  'اضافة',
  'الرئيسية',
];
List<String> imagesShopPage = [
  Assets.imagesSettingSeller,
  Assets.imagesPostSeller,
  Assets.imagesHomeSeller,
];