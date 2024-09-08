
import '../../../../hiraj/data/models/hiraj_model.dart';

class SellerModel {
  String? status;
  String? message;
  SellerData? sellerData;

  SellerModel({this.status, this.message, this.sellerData});

  SellerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    sellerData = json['seller_data'] != null
        ? SellerData.fromJson(json['seller_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (sellerData != null) {
      data['seller_data'] = sellerData!.toJson();
    }
    return data;
  }
}






///-------------------------------------///
class SellerCategoryModel {
  String? status;
  List<HirajData>? hirajData;

  SellerCategoryModel({this.status, this.hirajData});

  SellerCategoryModel.fromJson(Map<String, dynamic> json) {
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


///-------------------------------------///


class SellerModelHome {
  String? status;
  String? message;
  SellerData? sellerData;

  SellerModelHome({this.status, this.sellerData,this.message});

  SellerModelHome.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sellerData = json['sellerData'] != null
        ? SellerData.fromJson(json['sellerData'])
        : null;
    message = json['message'];
    sellerData = json['sellerData'] != null
        ? SellerData.fromJson(json['sellerData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = status;
    if (sellerData != null) {
      data['sellerData'] = sellerData!.toJson();
    }
    return data;
  }
}

class SellerData {
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
  int? sellerViewCount;
  String? sellerDelete;
  int? hirajId;
  int? parentId;

  SellerData(
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
        this.sellerDelete,
        this.sellerStatus,
        this.sellerViewCount,
        this.hirajId,
        this.parentId});

  SellerData.fromJson(Map<String, dynamic> json) {
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
    sellerViewCount = json['seller_view_count'];
    sellerDelete = json['seller_delete'];
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
    data['seller_delete'] = sellerDelete;
    data['seller_status'] = sellerStatus;
    data['seller_view_count'] = sellerViewCount;
    data['hiraj_id'] = hirajId;
    data['parent_id'] = parentId;
    return data;
  }
}




