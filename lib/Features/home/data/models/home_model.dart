import '../../../hiraj/data/models/hiraj_model.dart';

class HomeModel {
  String? status;
  Parent? parent;

  HomeModel({this.status, this.parent});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    parent =
    json['parent'] != null ? Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    return data;
  }
}

class Parent {
  String? status;
  List<Data>? data;
  LastShops? lastShops;
  LastProducts? lastProducts;
  Advertisement? advertisement;
  ShopsRating? shopsRating;

  Parent(
      {this.status,
        this.data,
        this.lastShops,
        this.lastProducts,
        this.advertisement,
        this.shopsRating
      });

  Parent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    lastShops = json['last_shops'] != null
        ? LastShops.fromJson(json['last_shops'])
        : null;
    lastProducts = json['last_products'] != null
        ? LastProducts.fromJson(json['last_products'])
        : null;
    advertisement = json['advertisement'] != null
        ? Advertisement.fromJson(json['advertisement'])
        : null;
    shopsRating = json['shopsRating'] != null
        ? ShopsRating.fromJson(json['shopsRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (lastShops != null) {
      data['last_shops'] = lastShops!.toJson();
    }
    if (lastProducts != null) {
      data['last_products'] = lastProducts!.toJson();
    }
    if (advertisement != null) {
      data['advertisement'] = advertisement!.toJson();
    }
    if (shopsRating != null) {
      data['shopsRating'] = shopsRating!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? appLogo;
  String? appDescription;
  Categories? categories;

  Data(
      {this.id, this.name, this.appLogo, this.appDescription, this.categories});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    appLogo = json['app_logo'];
    appDescription = json['app_description'];
    categories = json['categories'] != null
        ? Categories.fromJson(json['categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['app_logo'] = appLogo;
    data['app_description'] = appDescription;
    if (categories != null) {
      data['categories'] = categories!.toJson();
    }
    return data;
  }
}

class Categories {
  String? status;
  List<CategoriesData>? categoriesData;

  Categories({this.status, this.categoriesData});

  Categories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories_data'] != null) {
      categoriesData = <CategoriesData>[];
      json['categories_data'].forEach((v) {
        categoriesData!.add(CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (categoriesData != null) {
      data['categories_data'] =
          categoriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  int? parentId;
  Subcategories? subcategories;

  CategoriesData(
      {this.categoryId,
        this.categoryName,
        this.categoryImage,
        this.parentId,
        this.subcategories});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    parentId = json['Parent_id'];
    subcategories = json['subcategories'] != null
        ? Subcategories.fromJson(json['subcategories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['category_image'] = categoryImage;
    data['Parent_id'] = parentId;
    if (subcategories != null) {
      data['subcategories'] = subcategories!.toJson();
    }
    return data;
  }
}

class Subcategories {
  String? status;
  List<SubcategoriesData>? subcategoriesData;

  Subcategories({this.status, this.subcategoriesData});

  Subcategories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['subcategories_data'] != null) {
      subcategoriesData = <SubcategoriesData>[];
      json['subcategories_data'].forEach((v) {
        subcategoriesData!.add(SubcategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (subcategoriesData != null) {
      data['subcategories_data'] =
          subcategoriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubcategoriesData {
  int? subcategoriesId;
  String? subcategoriesTitle;
  String? subcategoriesImage;
  int? categoriesId;
  int? parentId;
  Shops? shops;

  SubcategoriesData(
      {this.subcategoriesId,
        this.subcategoriesTitle,
        this.subcategoriesImage,
        this.categoriesId,
        this.parentId,
        this.shops});

  SubcategoriesData.fromJson(Map<String, dynamic> json) {
    subcategoriesId = json['subcategories_id'];
    subcategoriesTitle = json['subcategories_title'];
    subcategoriesImage = json['subcategories_image'];
    categoriesId = json['categories_id'];
    parentId = json['parent_id'];
    shops = json['shops'] != null ? Shops.fromJson(json['shops']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcategories_id'] = subcategoriesId;
    data['subcategories_title'] = subcategoriesTitle;
    data['subcategories_image'] = subcategoriesImage;
    data['categories_id'] = categoriesId;
    data['parent_id'] = parentId;
    if (shops != null) {
      data['shops'] = shops!.toJson();
    }
    return data;
  }
}

class Shops {
  String? status;
  String? message;
  List<ShopsData>? shopsData;

  Shops({this.status, this.shopsData,this.message});

  Shops.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['shops_data'] != null) {
      shopsData = <ShopsData>[];
      json['shops_data'].forEach((v) {
        shopsData!.add(ShopsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (shopsData != null) {
      data['shops_data'] = shopsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopsData {
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
  ShopImages? shopImages;
  ShopServices? shopServices;
  ShopOffer? shopOffer;

  ShopsData(
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
        this.shopServices,
        this.shopOffer});

  ShopsData.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopImage = json['shop_image'];
    shopPhone = json['shop_phone'];
    shopAddress = json['shop_address'];
    shopInformation = json['shop_Information'];
    locationShop = json['location_shop'];
    shopFavorite = json['shopFavorite'];
    specialOffer = json['special_offer'];
    shopTimestart = json['shop_timestart'];
    shopTimeend = json['shop_timeend'];
    shopStatus = json['shop_status'];
    subcategoriesId = json['subcategories_id'];
    ratingShop = json['rating_shop'];
    parentId = json['parent_id'];
    shopImages = json['shop_images'] != null
        ? ShopImages.fromJson(json['shop_images'])
        : null;
    shopServices = json['shop_services'] != null
        ? ShopServices.fromJson(json['shop_services'])
        : null;
    shopOffer = json['shop_offer'] != null
        ? ShopOffer.fromJson(json['shop_offer'])
        : null;
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
    data['shopFavorite'] = shopFavorite;
    data['special_offer'] = specialOffer;
    data['shop_timestart'] = shopTimestart;
    data['shop_timeend'] = shopTimeend;
    data['shop_status'] = shopStatus;
    data['subcategories_id'] = subcategoriesId;
    data['rating_shop'] = ratingShop;
    data['parent_id'] = parentId;
    if (shopImages != null) {
      data['shop_images'] = shopImages!.toJson();
    }
    if (shopServices != null) {
      data['shop_services'] = shopServices!.toJson();
    }
    if (shopOffer != null) {
      data['shop_offer'] = shopOffer!.toJson();
    }
    return data;
  }
}

class ShopImages {
  String? status;
  List<ImagesData>? imagesData;

  ShopImages({this.status, this.imagesData});

  ShopImages.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['images_data'] != null) {
      imagesData = <ImagesData>[];
      json['images_data'].forEach((v) {
        imagesData!.add(ImagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (imagesData != null) {
      data['images_data'] = imagesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesData {
  int? shopImageId;
  String? shopImageUrl;
  int? shopId;

  ImagesData({this.shopImageId, this.shopImageUrl, this.shopId});

  ImagesData.fromJson(Map<String, dynamic> json) {
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

class ShopServices {
  String? status;
  List<ServicesData>? servicesData;

  ShopServices({this.status, this.servicesData});

  ShopServices.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['services_data'] != null) {
      servicesData = <ServicesData>[];
      json['services_data'].forEach((v) {
        servicesData!.add(ServicesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (servicesData != null) {
      data['services_data'] =
          servicesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServicesData {
  int? servicesId;
  String? shopServices;
  int? shopId;

  ServicesData({this.servicesId, this.shopServices, this.shopId});

  ServicesData.fromJson(Map<String, dynamic> json) {
    servicesId = json['services_id'];
    shopServices = json['shop_services'];
    shopId = json['shop_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['services_id'] = servicesId;
    data['shop_services'] = shopServices;
    data['shop_id'] = shopId;
    return data;
  }
}

class ShopOffer {
  String? status;
  List<ShopOfferData>? shopOfferData;

  ShopOffer({this.status, this.shopOfferData});

  ShopOffer.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['shop_offer_data'] != null) {
      shopOfferData = <ShopOfferData>[];
      json['shop_offer_data'].forEach((v) {
        shopOfferData!.add(ShopOfferData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (shopOfferData != null) {
      data['shop_offer_data'] =
          shopOfferData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopOfferData {
  int? offerId;
  String? offerTitle;
  String? offerDetails;
  String? offerImage;
  int? shopId;

  ShopOfferData(
      {this.offerId,
        this.offerTitle,
        this.offerDetails,
        this.offerImage,
        this.shopId});

  ShopOfferData.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerTitle = json['offer_title'];
    offerDetails = json['offer_details'];
    offerImage = json['offer_image'];
    shopId = json['shop_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offer_id'] = offerId;
    data['offer_title'] = offerTitle;
    data['offer_details'] = offerDetails;
    data['offer_image'] = offerImage;
    data['shop_id'] = shopId;
    return data;
  }
}

class LastShops {
  String? status;
  List<ShopsData>? shopsData;

  LastShops({this.status, this.shopsData});

  LastShops.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['shopsData'] != null) {
      shopsData = <ShopsData>[];
      json['shopsData'].forEach((v) {
        shopsData!.add(ShopsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (shopsData != null) {
      data['shopsData'] = shopsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LastProducts {
  String? status;
  List<LastProductsData>? lastProductsData;

  LastProducts({this.status, this.lastProductsData});

  LastProducts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Last_Products_data'] != null) {
      lastProductsData = <LastProductsData>[];
      json['Last_Products_data'].forEach((v) {
        lastProductsData!.add(LastProductsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (lastProductsData != null) {
      data['Last_Products_data'] =
          lastProductsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LastProductsData {
  int? idProduct;
  String? titleProduct;
  String? detailsProduct;
  String? imageProduct;
  String? newPriceProduct;
  int? oldPriceProduct;
  int? qualityProduct;
  int? deliveryService;
  int? statusProduct;
  String? startProduct;
  String? endProduct;
  String? ratingProduct;
  int? productFavorite;
  int? idSellerProduct;
  int? parentId;
  List<ProductImages>? productImages;
  Seller? seller;
  Hirajname? hirajname;

  LastProductsData(
      {this.idProduct,
        this.titleProduct,
        this.detailsProduct,
        this.imageProduct,
        this.newPriceProduct,
        this.oldPriceProduct,
        this.qualityProduct,
        this.deliveryService,
        this.statusProduct,
        this.startProduct,
        this.endProduct,
        this.ratingProduct,
        this.idSellerProduct,
        this.parentId,
        this.productImages,
        this.seller,
        this.productFavorite,
        this.hirajname});

  LastProductsData.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    titleProduct = json['title_product'];
    detailsProduct = json['details_product'];
    imageProduct = json['image_product'];
    newPriceProduct = json['new_price_product'];
    oldPriceProduct = json['old_price_product'];
    qualityProduct = json['quality_product'];
    deliveryService = json['delivery_service'];
    statusProduct = json['status_product'];
    startProduct = json['start_product'];
    endProduct = json['end_product'];
    productFavorite=json['productFavorite'];
    ratingProduct = json['rating_product'];
    idSellerProduct = json['id_seller_product'];
    parentId = json['parent_id'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
    seller =
    json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    hirajname = json['hirajname'] != null
        ? Hirajname.fromJson(json['hirajname'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_product'] = idProduct;
    data['title_product'] = titleProduct;
    data['details_product'] = detailsProduct;
    data['image_product'] = imageProduct;
    data['new_price_product'] = newPriceProduct;
    data['old_price_product'] = oldPriceProduct;
    data['quality_product'] = qualityProduct;
    data['delivery_service'] = deliveryService;
    data['status_product'] = statusProduct;
    data['start_product'] = startProduct;
    data['productFavorite'] = productFavorite;
    data['end_product'] = endProduct;
    data['rating_product'] = ratingProduct;
    data['id_seller_product'] = idSellerProduct;
    data['parent_id'] = parentId;
    if (productImages != null) {
      data['product_images'] =
          productImages!.map((v) => v.toJson()).toList();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (hirajname != null) {
      data['hirajname'] = hirajname!.toJson();
    }
    return data;
  }
}



class Seller {
  String? status;
  List<HirajSellerData>? hirajSellerData;

  Seller({this.status, this.hirajSellerData});

  Seller.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['hiraj_seller_data'] != null) {
      hirajSellerData = <HirajSellerData>[];
      json['hiraj_seller_data'].forEach((v) {
        hirajSellerData!.add(HirajSellerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (hirajSellerData != null) {
      data['hiraj_seller_data'] =
          hirajSellerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Hirajname {
  String? status;
  List<HirajData>? hirajData;

  Hirajname({this.status, this.hirajData});

  Hirajname.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['hirajData'] != null) {
      hirajData = <HirajData>[];
      json['hirajData'].forEach((v) {
        hirajData!.add(HirajData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (hirajData != null) {
      data['hirajData'] = hirajData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HirajData {
  int? idHiraj;
  String? nameHiraj;
  String? imageHiraj;
  int? idParent;

  HirajData({this.idHiraj, this.nameHiraj, this.imageHiraj, this.idParent});

  HirajData.fromJson(Map<String, dynamic> json) {
    idHiraj = json['id_hiraj'];
    nameHiraj = json['name_hiraj'];
    imageHiraj = json['image_hiraj'];
    idParent = json['id_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_hiraj'] = idHiraj;
    data['name_hiraj'] = nameHiraj;
    data['image_hiraj'] = imageHiraj;
    data['id_parent'] = idParent;
    return data;
  }
}

class Advertisement {
  String? status;
  List<AdvertisementData>? advertisementData;

  Advertisement({this.status, this.advertisementData});

  Advertisement.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['advertisement_data'] != null) {
      advertisementData = <AdvertisementData>[];
      json['advertisement_data'].forEach((v) {
        advertisementData!.add(AdvertisementData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (advertisementData != null) {
      data['advertisement_data'] =
          advertisementData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdvertisementData {
  int? idAdvertisement;
  String? titleAdvertisement;
  String? nameAdvertisement;
  String? subtitleAdvertisement;
  String? imageAdvertisement;
  String? phoneAdvertisement;
  String? informationAdvertisement;
  String? locationAdvertisement;
  String? timestartAdvertisement;
  String? endtimeAdvertisement;
  int? statusAdvertisement;
  int? parentId;

  AdvertisementData(
      {this.idAdvertisement,
        this.titleAdvertisement,
        this.subtitleAdvertisement,
        this.nameAdvertisement,
        this.informationAdvertisement,
        this.imageAdvertisement,
        this.phoneAdvertisement,
        this.locationAdvertisement,
        this.timestartAdvertisement,
        this.endtimeAdvertisement,
        this.statusAdvertisement,
        this.parentId});

  AdvertisementData.fromJson(Map<String, dynamic> json) {
    idAdvertisement = json['id_advertisement'];
    titleAdvertisement = json['title_advertisement'];
    nameAdvertisement = json['name_advertisement'];
    subtitleAdvertisement = json['subtitle_advertisement'];
    imageAdvertisement = json['image_advertisement'];
    phoneAdvertisement = json['phone_advertisement'];
    locationAdvertisement = json['location_advertisement'];
    timestartAdvertisement = json['timestart_advertisement'];
    endtimeAdvertisement = json['endtime_advertisement'];
    informationAdvertisement = json['information _advertisement'];
    statusAdvertisement = json['status_advertisement'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_advertisement'] = idAdvertisement;
    data['title_advertisement'] = titleAdvertisement;
    data['name_advertisement'] = nameAdvertisement;
    data['subtitle_advertisement'] = subtitleAdvertisement;
    data['image_advertisement'] = imageAdvertisement;
    data['phone_advertisement'] = phoneAdvertisement;
    data['location_advertisement'] = locationAdvertisement;
    data['information _advertisement'] = informationAdvertisement;
    data['timestart_advertisement'] = timestartAdvertisement;
    data['endtime_advertisement'] = endtimeAdvertisement;
    data['status_advertisement'] = statusAdvertisement;
    data['parent_id'] = parentId;
    return data;
  }
}

class RatingShop {
  String? message;
  int? allUsersCount;
  String? averageRating;

  RatingShop({this.message, this.allUsersCount, this.averageRating});

  RatingShop.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    allUsersCount = json['all_users_count'];
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['all_users_count'] = allUsersCount;
    data['average_rating'] = averageRating;
    return data;
  }
}

class ShopsRating {
  String? status;
  List<ShopsData>? shopsData;

  ShopsRating({this.status, this.shopsData});

  ShopsRating.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['shopsData'] != null) {
      shopsData = <ShopsData>[];
      json['shopsData'].forEach((v) {
        shopsData!.add(ShopsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (shopsData != null) {
      data['shopsData'] = shopsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

