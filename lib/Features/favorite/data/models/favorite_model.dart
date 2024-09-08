import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../hiraj/data/models/hiraj_model.dart';

class FavoriteModel {
  String? status;
  List<Sellers>? sellers;
  List<ProductData>? products;
  List<Shops>? shops;

  FavoriteModel({this.status, this.sellers, this.products, this.shops});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sellers'] != null) {
      sellers = <Sellers>[];
      json['sellers'].forEach((v) {
        sellers!.add(Sellers.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <ProductData>[];
      json['products'].forEach((v) {
        products!.add(ProductData.fromJson(v));
      });
    }
    if (json['shops'] != null) {
      shops = <Shops>[];
      json['shops'].forEach((v) {
        shops!.add(Shops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (sellers != null) {
      data['sellers'] = sellers!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (shops != null) {
      data['shops'] = shops!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sellers {
  int? idHirajSeller;
  String? nameHirajSelle;
  String? imageHirajSeller;
  String? addressSeller;
  String? locationSeller;
  String? phoneSeller;
  int? ratingSeller;
  String? startSeller;
  String? endSeller;
  String? codeHirajSelle;
  String? passwordHirajSelle;
  String? sellerStatus;
  int? hirajId;
  int? parentId;
  String? status;
  List<ProductData>? productsF;

  Sellers(
      {this.idHirajSeller,
        this.nameHirajSelle,
        this.imageHirajSeller,
        this.addressSeller,
        this.locationSeller,
        this.phoneSeller,
        this.ratingSeller,
        this.startSeller,
        this.endSeller,
        this.codeHirajSelle,
        this.passwordHirajSelle,
        this.sellerStatus,
        this.hirajId,
        this.parentId,
        this.status,
        this.productsF});

  Sellers.fromJson(Map<String, dynamic> json) {
    idHirajSeller = json['id_hiraj_seller'];
    nameHirajSelle = json['name_hiraj_selle'];
    imageHirajSeller = json['image_hiraj_seller'];
    addressSeller = json['address_seller'];
    locationSeller = json['location_seller'];
    phoneSeller = json['phone_seller'];
    ratingSeller = json['rating_seller'];
    startSeller = json['start_seller'];
    endSeller = json['end_seller'];
    codeHirajSelle = json['code_hiraj_selle'];
    passwordHirajSelle = json['password_hiraj_selle'];
    sellerStatus = json['seller_status'];
    hirajId = json['hiraj_id'];
    parentId = json['parent_id'];
    status = json['status'];
    if (json['products'] != null) {
      productsF = <ProductData>[];
      json['products'].forEach((v) {
        productsF!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_hiraj_seller'] = idHirajSeller;
    data['name_hiraj_selle'] = nameHirajSelle;
    data['image_hiraj_seller'] = imageHirajSeller;
    data['address_seller'] = addressSeller;
    data['location_seller'] = locationSeller;
    data['phone_seller'] = phoneSeller;
    data['rating_seller'] = ratingSeller;
    data['start_seller'] = startSeller;
    data['end_seller'] = endSeller;
    data['code_hiraj_selle'] = codeHirajSelle;
    data['password_hiraj_selle'] = passwordHirajSelle;
    data['seller_status'] = sellerStatus;
    data['hiraj_id'] = hirajId;
    data['parent_id'] = parentId;
    data['status'] = status;
    if (productsF != null) {
      data['products'] = productsF!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shops {
  int? shopId;
  String? shopName;
  String? shopImage;
  String? shopPhone;
  String? shopAddress;
  String? shopInformation;
  String? locationShop;
  int? shopFavorite;
  String? specialOffer;
  String? shopTimestart;
  String? shopTimeend;
  int? shopStatus;
  int? subcategoriesId;
  String? ratingShop;
  int? parentId;
  List<ShopImages>? shopImages;
  String? status;

  Shops(
      {this.shopId,
        this.shopName,
        this.shopImage,
        this.shopPhone,
        this.shopAddress,
        this.shopInformation,
        this.locationShop,
        this.shopFavorite,
        this.specialOffer,
        this.shopTimestart,
        this.shopTimeend,
        this.shopStatus,
        this.subcategoriesId,
        this.ratingShop,
        this.parentId,
        this.shopImages,
        this.status});

  Shops.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopImage = json['shop_image'];
    shopPhone = json['shop_phone'];
    shopAddress = json['shop_address'];
    shopInformation = json['shop_Information'];
    locationShop = json['location_shop'];
    shopFavorite = json['shop_favorite'];
    specialOffer = json['special_offer'];
    shopTimestart = json['shop_timestart'];
    shopTimeend = json['shop_timeend'];
    shopStatus = json['shop_status'];
    subcategoriesId = json['subcategories_id'];
    ratingShop = json['rating_shop'];
    parentId = json['parent_id'];
    if (json['shop_images'] != null) {
      shopImages = <ShopImages>[];
      json['shop_images'].forEach((v) {
        shopImages!.add(ShopImages.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['shop_image'] = shopImage;
    data['shop_phone'] = shopPhone;
    data['shop_address'] = shopAddress;
    data['shop_Information'] = shopInformation;
    data['location_shop'] = locationShop;
    data['shop_favorite'] = shopFavorite;
    data['special_offer'] = specialOffer;
    data['shop_timestart'] = shopTimestart;
    data['shop_timeend'] = shopTimeend;
    data['shop_status'] = shopStatus;
    data['subcategories_id'] = subcategoriesId;
    data['rating_shop'] = ratingShop;
    data['parent_id'] = parentId;
    if (shopImages != null) {
      data['shop_images'] = shopImages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class ShopImages {
  int? shopImageId;
  String? shopImageUrl;
  int? shopId;

  ShopImages({this.shopImageId, this.shopImageUrl, this.shopId});

  ShopImages.fromJson(Map<String, dynamic> json) {
    shopImageId = json['shop_image_id'];
    shopImageUrl = json['shop_image_Url'];
    shopId = json['shop_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shop_image_id'] = shopImageId;
    data['shop_image_Url'] = shopImageUrl;
    data['shop_id'] = shopId;
    return data;
  }
}
class Fav{
  final String image;
  final String title;

  Fav({required this.image,required this.title});

  static List<Fav> getItems(BuildContext context) {
    return [
      Fav(image: Assets.imagesProductes, title: 'منتجات'),
      Fav(image: Assets.imagesShops, title: 'محلات'),
      Fav(image: Assets.imagesSellers, title: 'بائعين'),
    ];
  }


}

class FavoriteDelete {
  String? message;

  FavoriteDelete({this.message});

  FavoriteDelete.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
class ProductSeller {
  int? idHirajSeller;
  String? nameHirajSelle;
  String? imageHirajSeller;
  String? addressSeller;
  String? locationSeller;
  String? phoneSeller;
  int? ratingSeller;
  String? startSeller;
  String? endSeller;
  String? codeHirajSelle;
  String? passwordHirajSelle;
  String? sellerStatus;
  int? hirajId;
  int? parentId;

  ProductSeller(
      {this.idHirajSeller,
        this.nameHirajSelle,
        this.imageHirajSeller,
        this.addressSeller,
        this.locationSeller,
        this.phoneSeller,
        this.ratingSeller,
        this.startSeller,
        this.endSeller,
        this.codeHirajSelle,
        this.passwordHirajSelle,
        this.sellerStatus,
        this.hirajId,
        this.parentId});

  ProductSeller.fromJson(Map<String, dynamic> json) {
    idHirajSeller = json['id_hiraj_seller'];
    nameHirajSelle = json['name_hiraj_selle'];
    imageHirajSeller = json['image_hiraj_seller'];
    addressSeller = json['address_seller'];
    locationSeller = json['location_seller'];
    phoneSeller = json['phone_seller'];
    ratingSeller = json['rating_seller'];
    startSeller = json['start_seller'];
    endSeller = json['end_seller'];
    codeHirajSelle = json['code_hiraj_selle'];
    passwordHirajSelle = json['password_hiraj_selle'];
    sellerStatus = json['seller_status'];
    hirajId = json['hiraj_id'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_hiraj_seller'] = idHirajSeller;
    data['name_hiraj_selle'] = nameHirajSelle;
    data['image_hiraj_seller'] = imageHirajSeller;
    data['address_seller'] = addressSeller;
    data['location_seller'] = locationSeller;
    data['phone_seller'] = phoneSeller;
    data['rating_seller'] = ratingSeller;
    data['start_seller'] = startSeller;
    data['end_seller'] = endSeller;
    data['code_hiraj_selle'] = codeHirajSelle;
    data['password_hiraj_selle'] = passwordHirajSelle;
    data['seller_status'] = sellerStatus;
    data['hiraj_id'] = hirajId;
    data['parent_id'] = parentId;
    return data;
  }
}

///

