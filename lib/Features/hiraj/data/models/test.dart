// class HirajModel {
//   String? status;
//   Hiraj? hiraj;
//   Products? products;
//   HirajSeller? hirajSeller;
//
//   HirajModel({this.status, this.hiraj, this.products, this.hirajSeller});
//
//   HirajModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     hiraj = json['hiraj'] != null ? new Hiraj.fromJson(json['hiraj']) : null;
//     products = json['products'] != null
//         ? new Products.fromJson(json['products'])
//         : null;
//     hirajSeller = json['hiraj_seller'] != null
//         ? new HirajSeller.fromJson(json['hiraj_seller'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.hiraj != null) {
//       data['hiraj'] = this.hiraj!.toJson();
//     }
//     if (this.products != null) {
//       data['products'] = this.products!.toJson();
//     }
//     if (this.hirajSeller != null) {
//       data['hiraj_seller'] = this.hirajSeller!.toJson();
//     }
//     return data;
//   }
// }
//
// class Hiraj {
//   String? status;
//   List<HirajData>? hirajData;
//
//   Hiraj({this.status, this.hirajData});
//
//   Hiraj.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['hirajData'] != null) {
//       hirajData = <HirajData>[];
//       json['hirajData'].forEach((v) {
//         hirajData!.add(new HirajData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.hirajData != null) {
//       data['hirajData'] = this.hirajData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class HirajData {
//   int? idHiraj;
//   String? nameHiraj;
//   String? imageHiraj;
//   int? idParent;
//   HirajSeller? hirajSeller;
//
//   HirajData(
//       {this.idHiraj,
//         this.nameHiraj,
//         this.imageHiraj,
//         this.idParent,
//         this.hirajSeller});
//
//   HirajData.fromJson(Map<String, dynamic> json) {
//     idHiraj = json['id_hiraj'];
//     nameHiraj = json['name_hiraj'];
//     imageHiraj = json['image_hiraj'];
//     idParent = json['id_parent'];
//     hirajSeller = json['hiraj_seller'] != null
//         ? new HirajSeller.fromJson(json['hiraj_seller'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_hiraj'] = this.idHiraj;
//     data['name_hiraj'] = this.nameHiraj;
//     data['image_hiraj'] = this.imageHiraj;
//     data['id_parent'] = this.idParent;
//     if (this.hirajSeller != null) {
//       data['hiraj_seller'] = this.hirajSeller!.toJson();
//     }
//     return data;
//   }
// }
//
// class HirajSeller {
//   String? status;
//   List<HirajSellerData>? hirajSellerData;
//
//   HirajSeller({this.status, this.hirajSellerData});
//
//   HirajSeller.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['hiraj_seller_data'] != null) {
//       hirajSellerData = <HirajSellerData>[];
//       json['hiraj_seller_data'].forEach((v) {
//         hirajSellerData!.add(new HirajSellerData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.hirajSellerData != null) {
//       data['hiraj_seller_data'] =
//           this.hirajSellerData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
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
//   List<Products>? products;
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
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_hiraj_seller'] = this.idHirajSeller;
//     data['name_hiraj_selle'] = this.nameHirajSelle;
//     data['image_hiraj_seller'] = this.imageHirajSeller;
//     data['address_seller'] = this.addressSeller;
//     data['location_seller'] = this.locationSeller;
//     data['phone_seller'] = this.phoneSeller;
//     data['rating_seller'] = this.ratingSeller;
//     data['start_seller'] = this.startSeller;
//     data['end_seller'] = this.endSeller;
//     data['code_hiraj_selle'] = this.codeHirajSelle;
//     data['password_hiraj_selle'] = this.passwordHirajSelle;
//     data['seller_status'] = this.sellerStatus;
//     data['hiraj_id'] = this.hirajId;
//     data['parent_id'] = this.parentId;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Products {
//   int? idProduct;
//   String? titleProduct;
//   String? detailsProduct;
//   String? imageProduct;
//   String? newPriceProduct;
//   int? oldPriceProduct;
//   int? qualityProduct;
//   int? deliveryService;
//   int? statusProduct;
//   String? startProduct;
//   String? endProduct;
//   String? ratingProduct;
//   int? idSellerProduct;
//   int? parentId;
//   int? favorite;
//
//   Products(
//       {this.idProduct,
//         this.titleProduct,
//         this.detailsProduct,
//         this.imageProduct,
//         this.newPriceProduct,
//         this.oldPriceProduct,
//         this.qualityProduct,
//         this.deliveryService,
//         this.statusProduct,
//         this.startProduct,
//         this.endProduct,
//         this.ratingProduct,
//         this.idSellerProduct,
//         this.parentId,
//         this.favorite});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     idProduct = json['id_product'];
//     titleProduct = json['title_product'];
//     detailsProduct = json['details_product'];
//     imageProduct = json['image_product'];
//     newPriceProduct = json['new_price_product'];
//     oldPriceProduct = json['old_price_product'];
//     qualityProduct = json['quality_product'];
//     deliveryService = json['delivery_service'];
//     statusProduct = json['status_product'];
//     startProduct = json['start_product'];
//     endProduct = json['end_product'];
//     ratingProduct = json['rating_product'];
//     idSellerProduct = json['id_seller_product'];
//     parentId = json['parent_id'];
//     favorite = json['favorite'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_product'] = this.idProduct;
//     data['title_product'] = this.titleProduct;
//     data['details_product'] = this.detailsProduct;
//     data['image_product'] = this.imageProduct;
//     data['new_price_product'] = this.newPriceProduct;
//     data['old_price_product'] = this.oldPriceProduct;
//     data['quality_product'] = this.qualityProduct;
//     data['delivery_service'] = this.deliveryService;
//     data['status_product'] = this.statusProduct;
//     data['start_product'] = this.startProduct;
//     data['end_product'] = this.endProduct;
//     data['rating_product'] = this.ratingProduct;
//     data['id_seller_product'] = this.idSellerProduct;
//     data['parent_id'] = this.parentId;
//     data['favorite'] = this.favorite;
//     return data;
//   }
// }
//
// class Products {
//   String? status;
//   List<ProductData>? productData;
//
//   Products({this.status, this.productData});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['product_data'] != null) {
//       productData = <ProductData>[];
//       json['product_data'].forEach((v) {
//         productData!.add(new ProductData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.productData != null) {
//       data['product_data'] = this.productData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ProductData {
//   int? idProduct;
//   String? titleProduct;
//   String? detailsProduct;
//   String? imageProduct;
//   String? newPriceProduct;
//   int? oldPriceProduct;
//   int? qualityProduct;
//   int? deliveryService;
//   int? statusProduct;
//   String? startProduct;
//   String? endProduct;
//   String? ratingProduct;
//   int? idSellerProduct;
//   int? parentId;
//   List<ProductImages>? productImages;
//   HirajSeller? seller;
//   Hiraj? hirajname;
//   int? favorite;
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
//         this.startProduct,
//         this.endProduct,
//         this.ratingProduct,
//         this.idSellerProduct,
//         this.parentId,
//         this.productImages,
//         this.seller,
//         this.hirajname,
//         this.favorite});
//
//   ProductData.fromJson(Map<String, dynamic> json) {
//     idProduct = json['id_product'];
//     titleProduct = json['title_product'];
//     detailsProduct = json['details_product'];
//     imageProduct = json['image_product'];
//     newPriceProduct = json['new_price_product'];
//     oldPriceProduct = json['old_price_product'];
//     qualityProduct = json['quality_product'];
//     deliveryService = json['delivery_service'];
//     statusProduct = json['status_product'];
//     startProduct = json['start_product'];
//     endProduct = json['end_product'];
//     ratingProduct = json['rating_product'];
//     idSellerProduct = json['id_seller_product'];
//     parentId = json['parent_id'];
//     if (json['product_images'] != null) {
//       productImages = <ProductImages>[];
//       json['product_images'].forEach((v) {
//         productImages!.add(new ProductImages.fromJson(v));
//       });
//     }
//     seller = json['seller'] != null
//         ? new HirajSeller.fromJson(json['seller'])
//         : null;
//     hirajname = json['hirajname'] != null
//         ? new Hiraj.fromJson(json['hirajname'])
//         : null;
//     favorite = json['favorite'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_product'] = this.idProduct;
//     data['title_product'] = this.titleProduct;
//     data['details_product'] = this.detailsProduct;
//     data['image_product'] = this.imageProduct;
//     data['new_price_product'] = this.newPriceProduct;
//     data['old_price_product'] = this.oldPriceProduct;
//     data['quality_product'] = this.qualityProduct;
//     data['delivery_service'] = this.deliveryService;
//     data['status_product'] = this.statusProduct;
//     data['start_product'] = this.startProduct;
//     data['end_product'] = this.endProduct;
//     data['rating_product'] = this.ratingProduct;
//     data['id_seller_product'] = this.idSellerProduct;
//     data['parent_id'] = this.parentId;
//     if (this.productImages != null) {
//       data['product_images'] =
//           this.productImages!.map((v) => v.toJson()).toList();
//     }
//     if (this.seller != null) {
//       data['seller'] = this.seller!.toJson();
//     }
//     if (this.hirajname != null) {
//       data['hirajname'] = this.hirajname!.toJson();
//     }
//     data['favorite'] = this.favorite;
//     return data;
//   }
// }
//
// class ProductImages {
//   int? productImageId;
//   String? productImage;
//   int? productId;
//
//   ProductImages({this.productImageId, this.productImage, this.productId});
//
//   ProductImages.fromJson(Map<String, dynamic> json) {
//     productImageId = json['product_image_id'];
//     productImage = json['product_image'];
//     productId = json['product_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_image_id'] = this.productImageId;
//     data['product_image'] = this.productImage;
//     data['product_id'] = this.productId;
//     return data;
//   }
// }
//
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
//         this.parentId});
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
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_hiraj_seller'] = this.idHirajSeller;
//     data['name_hiraj_selle'] = this.nameHirajSelle;
//     data['image_hiraj_seller'] = this.imageHirajSeller;
//     data['address_seller'] = this.addressSeller;
//     data['location_seller'] = this.locationSeller;
//     data['phone_seller'] = this.phoneSeller;
//     data['rating_seller'] = this.ratingSeller;
//     data['start_seller'] = this.startSeller;
//     data['end_seller'] = this.endSeller;
//     data['code_hiraj_selle'] = this.codeHirajSelle;
//     data['password_hiraj_selle'] = this.passwordHirajSelle;
//     data['seller_status'] = this.sellerStatus;
//     data['hiraj_id'] = this.hirajId;
//     data['parent_id'] = this.parentId;
//     return data;
//   }
// }
//
// class HirajData {
//   int? idHiraj;
//   String? nameHiraj;
//   String? imageHiraj;
//   int? idParent;
//
//   HirajData({this.idHiraj, this.nameHiraj, this.imageHiraj, this.idParent});
//
//   HirajData.fromJson(Map<String, dynamic> json) {
//     idHiraj = json['id_hiraj'];
//     nameHiraj = json['name_hiraj'];
//     imageHiraj = json['image_hiraj'];
//     idParent = json['id_parent'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_hiraj'] = this.idHiraj;
//     data['name_hiraj'] = this.nameHiraj;
//     data['image_hiraj'] = this.imageHiraj;
//     data['id_parent'] = this.idParent;
//     return data;
//   }
// }
