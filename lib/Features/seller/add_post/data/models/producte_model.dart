// class ProductsModel {
//   String? status;
//   List<DataProductsSeller>? dataProductsSeller;
//
//   ProductsModel({this.status, this.dataProductsSeller});
//
//   ProductsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data_products_seller'] != null) {
//       dataProductsSeller = <DataProductsSeller>[];
//       json['data_products_seller'].forEach((v) {
//         dataProductsSeller!.add(DataProductsSeller.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (dataProductsSeller != null) {
//       data['data_products_seller'] =
//           dataProductsSeller!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class DataProductsSeller {
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
//
//   DataProductsSeller(
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
//         this.idSellerProduct});
//
//   DataProductsSeller.fromJson(Map<String, dynamic> json) {
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
//     data['delivery_service'] = deliveryService;
//     data['status_product'] = statusProduct;
//     data['start_product'] = startProduct;
//     data['end_product'] = endProduct;
//     data['rating_product'] = ratingProduct;
//     data['id_seller_product'] = idSellerProduct;
//     return data;
//   }
// }


///
class ProductsModel {
  String? status;
  Message? message;

  ProductsModel({this.status, this.message});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    return data;
  }
}

class Message {
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

  Message(
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
        this.parentId});

  Message.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_product'] = this.idProduct;
    data['title_product'] = this.titleProduct;
    data['details_product'] = this.detailsProduct;
    data['image_product'] = this.imageProduct;
    data['new_price_product'] = this.newPriceProduct;
    data['old_price_product'] = this.oldPriceProduct;
    data['quality_product'] = this.qualityProduct;
    data['delivery_service'] = this.deliveryService;
    data['status_product'] = this.statusProduct;
    data['start_product'] = this.startProduct;
    data['end_product'] = this.endProduct;
    data['rating_product'] = this.ratingProduct;
    data['id_seller_product'] = this.idSellerProduct;
    data['parent_id'] = this.parentId;
    return data;
  }
}
