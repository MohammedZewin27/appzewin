
class HirajModel {
  String? status;
  Hiraj? hiraj;
  Products? products;
  HirajSeller? hirajSeller;
  ProductsRating? productsRating;

  HirajModel({this.status, this.hiraj, this.products, this.hirajSeller,this.productsRating});

  HirajModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    hiraj = json['hiraj'] != null ? Hiraj.fromJson(json['hiraj']) : null;
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
    hirajSeller = json['hiraj_seller'] != null
        ? HirajSeller.fromJson(json['hiraj_seller'])
        : null;
    productsRating = json['productsRating'] != null
        ? ProductsRating.fromJson(json['productsRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (hiraj != null) {
      data['hiraj'] = hiraj!.toJson();
    }
    if (products != null) {
      data['products'] = products!.toJson();
    }
    if (hirajSeller != null) {
      data['hiraj_seller'] = hirajSeller!.toJson();
    }
    if (productsRating != null) {
      data['productsRating'] = productsRating!.toJson();
    }
    return data;
  }
}

class Hiraj {
  String? status;
  List<HirajData>? hirajData;

  Hiraj({this.status, this.hirajData});

  Hiraj.fromJson(Map<String, dynamic> json) {
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
  HirajSeller? hirajSeller;

  HirajData(
      {this.idHiraj,
        this.nameHiraj,
        this.imageHiraj,
        this.idParent,
        this.hirajSeller});

  HirajData.fromJson(Map<String, dynamic> json) {
    idHiraj = json['id_hiraj'];
    nameHiraj = json['name_hiraj'];
    imageHiraj = json['image_hiraj'];
    idParent = json['id_parent'];
    hirajSeller = json['hiraj_seller'] != null
        ? HirajSeller.fromJson(json['hiraj_seller'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_hiraj'] = idHiraj;
    data['name_hiraj'] = nameHiraj;
    data['image_hiraj'] = imageHiraj;
    data['id_parent'] = idParent;
    if (hirajSeller != null) {
      data['hiraj_seller'] = hirajSeller!.toJson();
    }
    return data;
  }
}

class HirajSeller {
  String? status;
  List<HirajSellerData>? hirajSellerData;

  HirajSeller({this.status, this.hirajSellerData});

  HirajSeller.fromJson(Map<String, dynamic> json) {
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

// class HirajSellerData {
//   int? idHirajSeller;
//   String? nameHirajSelle;
//   String? imageHirajSeller;
//   String? addressSeller;
//   String? locationSeller;
//   String? phoneSeller;
//   int? ratingSeller;
//   String? startSeller;
//   String? endSeller;
//   String? codeHirajSelle;
//   String? passwordHirajSelle;
//   String? sellerStatus;
//   int? hirajId;
//   int? parentId;
//   Products? products;
//
//   HirajSellerData(
//       {this.idHirajSeller,
//         this.nameHirajSelle,
//         this.imageHirajSeller,
//         this.addressSeller,
//         this.locationSeller,
//         this.phoneSeller,
//         this.ratingSeller,
//         this.startSeller,
//         this.endSeller,
//         this.codeHirajSelle,
//         this.passwordHirajSelle,
//         this.sellerStatus,
//         this.hirajId,
//         this.parentId,
//         this.products});
//
//   HirajSellerData.fromJson(Map<String, dynamic> json) {
//     idHirajSeller = json['id_hiraj_seller'];
//     nameHirajSelle = json['name_hiraj_selle'];
//     imageHirajSeller = json['image_hiraj_seller'];
//     addressSeller = json['address_seller'];
//     locationSeller = json['location_seller'];
//     phoneSeller = json['phone_seller'];
//     ratingSeller = json['rating_seller'];
//     startSeller = json['start_seller'];
//     endSeller = json['end_seller'];
//     codeHirajSelle = json['code_hiraj_selle'];
//     passwordHirajSelle = json['password_hiraj_selle'];
//     sellerStatus = json['seller_status'];
//     hirajId = json['hiraj_id'];
//     parentId = json['parent_id'];
//     products = json['products'] != null
//         ? Products.fromJson(json['products'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id_hiraj_seller'] = idHirajSeller;
//     data['name_hiraj_selle'] = nameHirajSelle;
//     data['image_hiraj_seller'] = imageHirajSeller;
//     data['address_seller'] = addressSeller;
//     data['location_seller'] = locationSeller;
//     data['phone_seller'] = phoneSeller;
//     data['rating_seller'] = ratingSeller;
//     data['start_seller'] = startSeller;
//     data['end_seller'] = endSeller;
//     data['code_hiraj_selle'] = codeHirajSelle;
//     data['password_hiraj_selle'] = passwordHirajSelle;
//     data['seller_status'] = sellerStatus;
//     data['hiraj_id'] = hirajId;
//     data['parent_id'] = parentId;
//     if (products != null) {
//       data['products'] = products!.toJson();
//     }
//     return data;
//   }
// }
class HirajSellerData {
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
  int? sellerFavorite;
  Products? products;

  HirajSellerData(
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
        this.sellerFavorite,
        this.products});

  HirajSellerData.fromJson(Map<String, dynamic> json) {
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
    sellerFavorite = json['sellerFavorite'];
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
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
    data['sellerFavorite'] = sellerFavorite;
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}
class Products {
  String? status;
  List<ProductData>? productData;

  Products({this.status, this.productData});

  Products.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (productData != null) {
      data['product_data'] = productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ProductsRating {
  String? status;
  List<ProductData>? productData;

  ProductsRating({this.status, this.productData});

  ProductsRating.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (productData != null) {
      data['product_data'] = productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class ProductImages {
  int? productImageId;
  String? productImage;
  int? productId;

  ProductImages({this.productImageId, this.productImage, this.productId});

  ProductImages.fromJson(Map<String, dynamic> json) {
    productImageId = json['product_image_id'];
    productImage = json['product_image'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_image_id'] = productImageId;
    data['product_image'] = productImage;
    data['product_id'] = productId;
    return data;
  }
}

// class ProductData {
//   int? idProduct;
//   String? titleProduct;
//   String? detailsProduct;
//   String? imageProduct;
//   String? newPriceProduct;
//   int? oldPriceProduct;
//   int? qualityProduct;
//   int? productFavorite;
//   int? deliveryService;
//   int? statusProduct;
//   String? startProduct;
//   String? endProduct;
//   String? ratingProduct;
//   int? idSellerProduct;
//   int? parentId;
//   List<ProductImages>? productImages;
//   HirajSeller? seller;
//   ProductSeller? productSeller;
//   Hiraj? hirajname;
//
//   ProductData(
//       {this.idProduct,
//         this.titleProduct,
//         this.detailsProduct,
//         this.imageProduct,
//         this.newPriceProduct,
//         this.oldPriceProduct,
//         this.qualityProduct,
//         this.deliveryService,
//         this.statusProduct,
//         this.productFavorite,
//         this.startProduct,
//         this.endProduct,
//         this.ratingProduct,
//         this.idSellerProduct,
//         this.parentId,
//         this.productImages,
//         this.seller,
//         this.hirajname});
//
//   ProductData.fromJson(Map<String, dynamic> json) {
//     idProduct = json['id_product'];
//     titleProduct = json['title_product'];
//     detailsProduct = json['details_product'];
//     imageProduct = json['image_product'];
//     newPriceProduct = json['new_price_product'];
//     oldPriceProduct = json['old_price_product'];
//     productFavorite = json['productFavorite'];
//     qualityProduct = json['quality_product'];
//     deliveryService = json['delivery_service'];
//     statusProduct = json['status_product'];
//     startProduct = json['start_product'];
//     endProduct = json['end_product'];
//     ratingProduct = json['rating_product'];
//     idSellerProduct = json['id_seller_product'];
//     parentId = json['parent_id'];
//     productSeller = json['product_seller'] != null
//         ? new ProductSeller.fromJson(json['product_seller'])
//         : null;
//     if (json['product_images'] != null) {
//       productImages = <ProductImages>[];
//       json['product_images'].forEach((v) {
//         productImages!.add(ProductImages.fromJson(v));
//       });
//     }
//     seller = json['seller'] != null
//         ? HirajSeller.fromJson(json['seller'])
//         : null;
//     hirajname = json['hirajname'] != null
//         ? Hiraj.fromJson(json['hirajname'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id_product'] = idProduct;
//     data['title_product'] = titleProduct;
//     data['details_product'] = detailsProduct;
//     data['image_product'] = imageProduct;
//     data['new_price_product'] = newPriceProduct;
//     data['old_price_product'] = oldPriceProduct;
//     data['quality_product'] = qualityProduct;
//     data['productFavorite'] = productFavorite;
//     data['delivery_service'] = deliveryService;
//     data['status_product'] = statusProduct;
//     data['start_product'] = startProduct;
//     data['end_product'] = endProduct;
//     data['rating_product'] = ratingProduct;
//     data['id_seller_product'] = idSellerProduct;
//     data['parent_id'] = parentId;
//     if (this.productSeller != null) {
//       data['product_seller'] = this.productSeller!.toJson();
//     }
//     if (productImages != null) {
//       data['product_images'] =
//           productImages!.map((v) => v.toJson()).toList();
//     }
//     if (seller != null) {
//       data['seller'] = seller!.toJson();
//     }
//     if (hirajname != null) {
//       data['hirajname'] = hirajname!.toJson();
//     }
//     return data;
//   }
// }
class ProductData {
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
  int? idSellerProduct;
  int? parentId;
  int? favoriteCount;
  int? productFavorite;
  List<ProductImages>? productImages;
  HirajSeller? seller;
  Hiraj? hirajname;

  ProductData(
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
        this.favoriteCount,
        this.productFavorite,
        this.productImages,
        this.seller,
        this.hirajname});

  ProductData.fromJson(Map<String, dynamic> json) {
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
    ratingProduct = json['rating_product'];
    idSellerProduct = json['id_seller_product'];
    parentId = json['parent_id'];
    favoriteCount = json['favorite_count'];
    productFavorite = json['productFavorite'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
    seller = json['seller'] != null
        ? HirajSeller.fromJson(json['seller'])
        : null;
    hirajname = json['hirajname'] != null
        ? Hiraj.fromJson(json['hirajname'])
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
    data['end_product'] = endProduct;
    data['rating_product'] = ratingProduct;
    data['id_seller_product'] = idSellerProduct;
    data['parent_id'] = parentId;
    data['favorite_count'] = favoriteCount;
    data['productFavorite'] = productFavorite;
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

class RatingProduct {
  String? message;
  int? allUsersCount;
  String? averageRating;

  RatingProduct({this.message, this.allUsersCount, this.averageRating});

  RatingProduct.fromJson(Map<String, dynamic> json) {
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

class FavoriteProducts {
  String? message;
  int? value;

  FavoriteProducts({this.message, this.value});

  FavoriteProducts.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['value'] = value;
    return data;
  }
}




