
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class AddShopInDatabaseModel {
  String? status;
  ShopData? shopData;
  String? message;

  AddShopInDatabaseModel({this.status, this.shopData});

  AddShopInDatabaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    shopData = json['shopData'] != null
        ? new ShopData.fromJson(json['shopData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (shopData != null) {
      data['shopData'] = shopData!.toJson();
    }
    return data;
  }
}

class ShopData {
  int? shopId;
  String? shopName;
  String? shopImage;
  String? shopPhone;
  String? shopAddress;
  String? shopInformation;
  String? locationShop;
  String? specialOffer;
  String? shopTimestart;
  String? shopTimeend;
  int? shopStatus;
  int? subcategoriesId;
  String? ratingShop;
  String? passwordShop;
  String? codeShop;
  int? parentId;

  ShopData(
      {this.shopId,
        this.shopName,
        this.shopImage,
        this.shopPhone,
        this.shopAddress,
        this.shopInformation,
        this.locationShop,
        this.specialOffer,
        this.shopTimestart,
        this.shopTimeend,
        this.shopStatus,
        this.subcategoriesId,
        this.ratingShop,
        this.passwordShop,
        this.codeShop,
        this.parentId});

  ShopData.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopImage = json['shop_image'];
    shopPhone = json['shop_phone'];
    shopAddress = json['shop_address'];
    shopInformation = json['shop_Information'];
    locationShop = json['location_shop'];
    specialOffer = json['special_offer'];
    shopTimestart = json['shop_timestart'];
    shopTimeend = json['shop_timeend'];
    shopStatus = json['shop_status'];
    subcategoriesId = json['subcategories_id'];
    ratingShop = json['rating_shop'];
    passwordShop = json['password_shop'];
    codeShop = json['code_shop'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['shop_image'] = this.shopImage;
    data['shop_phone'] = this.shopPhone;
    data['shop_address'] = this.shopAddress;
    data['shop_Information'] = this.shopInformation;
    data['location_shop'] = this.locationShop;
    data['special_offer'] = this.specialOffer;
    data['shop_timestart'] = this.shopTimestart;
    data['shop_timeend'] = this.shopTimeend;
    data['shop_status'] = this.shopStatus;
    data['subcategories_id'] = this.subcategoriesId;
    data['rating_shop'] = this.ratingShop;
    data['password_shop'] = this.passwordShop;
    data['code_shop'] = this.codeShop;
    data['parent_id'] = this.parentId;
    return data;
  }
}

class TabShopUser{
  final String image;
  final String title;

  TabShopUser({required this.image,required this.title});

  static List<TabShopUser> getItems(BuildContext context) {
    return [
      TabShopUser(image: Assets.imagesInformationShop, title: 'بيانات'),
      TabShopUser(image: Assets.imagesSettengshop, title: 'اعدادت'),


      // TabShopUser(image: Assets.imagesSellers, title: 'بائعين'),
    ];
  }


}