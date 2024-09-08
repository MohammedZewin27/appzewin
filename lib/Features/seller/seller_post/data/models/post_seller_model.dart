class PostSellerModel {
  String? status;
  Product? product;

  PostSellerModel({this.status, this.product});

  PostSellerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? status;
  List<ProductsSeller>? productsSeller;

  Product({this.status, this.productsSeller});

  Product.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products_seller'] != null) {
      productsSeller = <ProductsSeller>[];
      json['products_seller'].forEach((v) {
        productsSeller!.add(new ProductsSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.productsSeller != null) {
      data['products_seller'] =
          this.productsSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsSeller {
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
  ProductImages? productImages;

  ProductsSeller(
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
        this.productImages});

  ProductsSeller.fromJson(Map<String, dynamic> json) {
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
    productImages = json['product_images'] != null
        ? new ProductImages.fromJson(json['product_images'])
        : null;
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
    if (this.productImages != null) {
      data['product_images'] = this.productImages!.toJson();
    }
    return data;
  }
}

class ProductImages {
  String? status;
  List<ProductImagesData>? productImagesData;

  ProductImages({this.status, this.productImagesData});

  ProductImages.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['product_images_data'] != null) {
      productImagesData = <ProductImagesData>[];
      json['product_images_data'].forEach((v) {
        productImagesData!.add(new ProductImagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.productImagesData != null) {
      data['product_images_data'] =
          this.productImagesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImagesData {
  int? productImageId;
  String? productImage;
  int? productId;

  ProductImagesData({this.productImageId, this.productImage, this.productId});

  ProductImagesData.fromJson(Map<String, dynamic> json) {
    productImageId = json['product_image_id'];
    productImage = json['product_image'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_id'] = this.productImageId;
    data['product_image'] = this.productImage;
    data['product_id'] = this.productId;
    return data;
  }
}

class UpdateProduct {
  String? status;
  Data? data;

  UpdateProduct({this.status, this.data});

  UpdateProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
class ImagesProductModel {
  String? status;
  List<ImagesProductSeller>? imagesProductSeller;

  ImagesProductModel({this.status, this.imagesProductSeller});

  ImagesProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['ImagesProductSeller'] != null) {
      imagesProductSeller = <ImagesProductSeller>[];
      json['ImagesProductSeller'].forEach((v) {
        imagesProductSeller!.add(new ImagesProductSeller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.imagesProductSeller != null) {
      data['ImagesProductSeller'] =
          this.imagesProductSeller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesProductSeller {
  int? productImageId;
  String? productImage;
  int? productId;

  ImagesProductSeller({this.productImageId, this.productImage, this.productId});

  ImagesProductSeller.fromJson(Map<String, dynamic> json) {
    productImageId = json['product_image_id'];
    productImage = json['product_image'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_id'] = this.productImageId;
    data['product_image'] = this.productImage;
    data['product_id'] = this.productId;
    return data;
  }
}

class ImagesAddModel {
  String? status;
  ImageData? imageData;

  ImagesAddModel({this.status, this.imageData});

  ImagesAddModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    imageData = json['imageData'] != null
        ? new ImageData.fromJson(json['imageData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.imageData != null) {
      data['imageData'] = this.imageData!.toJson();
    }
    return data;
  }
}

class ImageData {
  int? productImageId;
  String? productImage;
  int? productId;

  ImageData({this.productImageId, this.productImage, this.productId});

  ImageData.fromJson(Map<String, dynamic> json) {
    productImageId = json['product_image_id'];
    productImage = json['product_image'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_id'] = this.productImageId;
    data['product_image'] = this.productImage;
    data['product_id'] = this.productId;
    return data;
  }
}
