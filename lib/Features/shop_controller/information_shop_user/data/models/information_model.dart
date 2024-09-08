class ShopImagesUser {
  String? status;
  List<ImagesData>? imagesData;

  ShopImagesUser({this.status, this.imagesData});

  ShopImagesUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['imagesData'] != null) {
      imagesData = <ImagesData>[];
      json['imagesData'].forEach((v) {
        imagesData!.add(new ImagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.imagesData != null) {
      data['imagesData'] = this.imagesData!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_image_id'] = this.shopImageId;
    data['shop_image_Url'] = this.shopImageUrl;
    data['shop_id'] = this.shopId;
    return data;
  }
}
class DeleteShopImage {
  String? status;
  ImagesData? imagesData;

  DeleteShopImage({this.status, this.imagesData});

  DeleteShopImage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    imagesData = json['imagesData'] != null
        ? new ImagesData.fromJson(json['imagesData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.imagesData != null) {
      data['imagesData'] = this.imagesData!.toJson();
    }
    return data;
  }
}

class ServicesShowShopModel {
  String? status;
  List<Services>? services;

  ServicesShowShopModel({this.status, this.services});

  ServicesShowShopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? servicesId;
  String? shopServices;
  int? shopId;

  Services({this.servicesId, this.shopServices, this.shopId});

  Services.fromJson(Map<String, dynamic> json) {
    servicesId = json['services_id'];
    shopServices = json['shop_services'];
    shopId = json['shop_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['services_id'] = this.servicesId;
    data['shop_services'] = this.shopServices;
    data['shop_id'] = this.shopId;
    return data;
  }
}

class AddServicesShopModel {
  String? status;
  Services? services;

  AddServicesShopModel({this.status, this.services});

  AddServicesShopModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    services = json['services'] != null
        ? new Services.fromJson(json['services'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.services != null) {
      data['services'] = this.services!.toJson();
    }
    return data;
  }
}



// class ImagesData {
//   int? shopImageId;
//   String? shopImageUrl;
//   int? shopId;
//
//   ImagesData({this.shopImageId, this.shopImageUrl, this.shopId});
//
//   ImagesData.fromJson(Map<String, dynamic> json) {
//     shopImageId = json['shop_image_id'];
//     shopImageUrl = json['shop_image_Url'];
//     shopId = json['shop_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['shop_image_id'] = this.shopImageId;
//     data['shop_image_Url'] = this.shopImageUrl;
//     data['shop_id'] = this.shopId;
//     return data;
//   }
// }



