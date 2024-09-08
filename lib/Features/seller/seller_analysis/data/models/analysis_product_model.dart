class AnalysisProductModel {
  String? status;
  AnalysisProduct? analysisProduct;

  AnalysisProductModel({this.status, this.analysisProduct});

  AnalysisProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    analysisProduct = json['analysis_product'] != null
        ? new AnalysisProduct.fromJson(json['analysis_product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.analysisProduct != null) {
      data['analysis_product'] = this.analysisProduct!.toJson();
    }
    return data;
  }
}

class AnalysisProduct {
  List<LocationProductData>? locationProductData;
  List<SharingProductData>? sharingProductData;
  List<CallProductData>? callProductData;
  List<WhatsAppProductData>? whatsAppProductData;
  List<FavoriteProductData>? favoriteProductData;
  List<EntryProductData>? entryProductData;
  List<RatingCountProductData>? ratingCountProductData;

  AnalysisProduct(
      {this.locationProductData,
        this.sharingProductData,
        this.callProductData,
        this.whatsAppProductData,
        this.favoriteProductData,
        this.entryProductData,
        this.ratingCountProductData});

  AnalysisProduct.fromJson(Map<String, dynamic> json) {
    if (json['locationProductData'] != null) {
      locationProductData = <LocationProductData>[];
      json['locationProductData'].forEach((v) {
        locationProductData!.add(new LocationProductData.fromJson(v));
      });
    }
    if (json['sharingProductData'] != null) {
      sharingProductData = <SharingProductData>[];
      json['sharingProductData'].forEach((v) {
        sharingProductData!.add(new SharingProductData.fromJson(v));
      });
    }
    if (json['callProductData'] != null) {
      callProductData = <CallProductData>[];
      json['callProductData'].forEach((v) {
        callProductData!.add(new CallProductData.fromJson(v));
      });
    }
    if (json['whatsAppProductData'] != null) {
      whatsAppProductData = <WhatsAppProductData>[];
      json['whatsAppProductData'].forEach((v) {
        whatsAppProductData!.add(new WhatsAppProductData.fromJson(v));
      });
    }
    if (json['favoriteProductData'] != null) {
      favoriteProductData = <FavoriteProductData>[];
      json['favoriteProductData'].forEach((v) {
        favoriteProductData!.add(new FavoriteProductData.fromJson(v));
      });
    }
    if (json['entryProductData'] != null) {
      entryProductData = <EntryProductData>[];
      json['entryProductData'].forEach((v) {
        entryProductData!.add(new EntryProductData.fromJson(v));
      });
    }
    if (json['ratingCountProductData'] != null) {
      ratingCountProductData = <RatingCountProductData>[];
      json['ratingCountProductData'].forEach((v) {
        ratingCountProductData!.add(new RatingCountProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationProductData != null) {
      data['locationProductData'] =
          this.locationProductData!.map((v) => v.toJson()).toList();
    }
    if (this.sharingProductData != null) {
      data['sharingProductData'] =
          this.sharingProductData!.map((v) => v.toJson()).toList();
    }
    if (this.callProductData != null) {
      data['callProductData'] =
          this.callProductData!.map((v) => v.toJson()).toList();
    }
    if (this.whatsAppProductData != null) {
      data['whatsAppProductData'] =
          this.whatsAppProductData!.map((v) => v.toJson()).toList();
    }
    if (this.favoriteProductData != null) {
      data['favoriteProductData'] =
          this.favoriteProductData!.map((v) => v.toJson()).toList();
    }
    if (this.entryProductData != null) {
      data['entryProductData'] =
          this.entryProductData!.map((v) => v.toJson()).toList();
    }
    if (this.ratingCountProductData != null) {
      data['ratingCountProductData'] =
          this.ratingCountProductData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationProductData {
  int? productLocationId;
  String? productLocationDate;
  int? productLocationProductId;
  int? productLocationSellerId;
  int? productLocationUserId;

  LocationProductData(
      {this.productLocationId,
        this.productLocationDate,
        this.productLocationProductId,
        this.productLocationSellerId,
        this.productLocationUserId});

  LocationProductData.fromJson(Map<String, dynamic> json) {
    productLocationId = json['product_location_id'];
    productLocationDate = json['product_location_date'];
    productLocationProductId = json['product_location_product_id'];
    productLocationSellerId = json['product_location_seller_id'];
    productLocationUserId = json['product_location_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_location_id'] = this.productLocationId;
    data['product_location_date'] = this.productLocationDate;
    data['product_location_product_id'] = this.productLocationProductId;
    data['product_location_seller_id'] = this.productLocationSellerId;
    data['product_location_user_id'] = this.productLocationUserId;
    return data;
  }
}

class SharingProductData {
  int? productSharingId;
  String? productSharingDate;
  int? productSharingProductId;
  int? productSharingSellerId;
  int? productSharingUserId;

  SharingProductData(
      {this.productSharingId,
        this.productSharingDate,
        this.productSharingProductId,
        this.productSharingSellerId,
        this.productSharingUserId});

  SharingProductData.fromJson(Map<String, dynamic> json) {
    productSharingId = json['product_sharing_id'];
    productSharingDate = json['product_sharing_date'];
    productSharingProductId = json['product_sharing_product_id'];
    productSharingSellerId = json['product_sharing_seller_id'];
    productSharingUserId = json['product_sharing_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_sharing_id'] = this.productSharingId;
    data['product_sharing_date'] = this.productSharingDate;
    data['product_sharing_product_id'] = this.productSharingProductId;
    data['product_sharing_seller_id'] = this.productSharingSellerId;
    data['product_sharing_user_id'] = this.productSharingUserId;
    return data;
  }
}

class CallProductData {
  int? productCallId;
  String? productCallDate;
  int? productCallProductId;
  int? productCallSellerId;
  int? productCallUserId;

  CallProductData(
      {this.productCallId,
        this.productCallDate,
        this.productCallProductId,
        this.productCallSellerId,
        this.productCallUserId});

  CallProductData.fromJson(Map<String, dynamic> json) {
    productCallId = json['product_call_id'];
    productCallDate = json['product_call_date'];
    productCallProductId = json['product_call_product_id'];
    productCallSellerId = json['product_call_seller_id'];
    productCallUserId = json['product_call_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_call_id'] = this.productCallId;
    data['product_call_date'] = this.productCallDate;
    data['product_call_product_id'] = this.productCallProductId;
    data['product_call_seller_id'] = this.productCallSellerId;
    data['product_call_user_id'] = this.productCallUserId;
    return data;
  }
}

class WhatsAppProductData {
  int? productWhatsappId;
  String? productWhatsappDate;
  int? productWhatsappProductId;
  int? productWhatsappSellerId;
  int? productWhatsappUserId;

  WhatsAppProductData(
      {this.productWhatsappId,
        this.productWhatsappDate,
        this.productWhatsappProductId,
        this.productWhatsappSellerId,
        this.productWhatsappUserId});

  WhatsAppProductData.fromJson(Map<String, dynamic> json) {
    productWhatsappId = json['product_whatsapp_id'];
    productWhatsappDate = json['product_whatsapp_date'];
    productWhatsappProductId = json['product_whatsapp_product_id'];
    productWhatsappSellerId = json['product_whatsapp_seller_id'];
    productWhatsappUserId = json['product_whatsapp_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_whatsapp_id'] = this.productWhatsappId;
    data['product_whatsapp_date'] = this.productWhatsappDate;
    data['product_whatsapp_product_id'] = this.productWhatsappProductId;
    data['product_whatsapp_seller_id'] = this.productWhatsappSellerId;
    data['product_whatsapp_user_id'] = this.productWhatsappUserId;
    return data;
  }
}

class FavoriteProductData {
  int? favoriteId;
  String? favoriteDateProduct;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? favoriteProductParentid;

  FavoriteProductData(
      {this.favoriteId,
        this.favoriteDateProduct,
        this.favoriteUsersid,
        this.favoriteItemsid,
        this.favoriteProductParentid});

  FavoriteProductData.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteDateProduct = json['favorite_date_product'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
    favoriteProductParentid = json['favorite_product_parentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_date_product'] = this.favoriteDateProduct;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
    data['favorite_product_parentid'] = this.favoriteProductParentid;
    return data;
  }
}

class EntryProductData {
  int? idEntryInteractionsProduct;
  String? entryDate;
  int? productIdEntryInteractions;
  int? sellerIdEntryInteractions;
  int? userIdEntryInteractions;

  EntryProductData(
      {this.idEntryInteractionsProduct,
        this.entryDate,
        this.productIdEntryInteractions,
        this.sellerIdEntryInteractions,
        this.userIdEntryInteractions});

  EntryProductData.fromJson(Map<String, dynamic> json) {
    idEntryInteractionsProduct = json['id_entry_interactions_product'];
    entryDate = json['entry_date'];
    productIdEntryInteractions = json['product_id_entry_interactions'];
    sellerIdEntryInteractions = json['seller_id_entry_interactions'];
    userIdEntryInteractions = json['user_id_entry_interactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_entry_interactions_product'] = this.idEntryInteractionsProduct;
    data['entry_date'] = this.entryDate;
    data['product_id_entry_interactions'] = this.productIdEntryInteractions;
    data['seller_id_entry_interactions'] = this.sellerIdEntryInteractions;
    data['user_id_entry_interactions'] = this.userIdEntryInteractions;
    return data;
  }
}

class RatingCountProductData {
  int? ratingId;
  int? ratingUserId;
  int? ratingProductId;
  int? ratingValue;

  RatingCountProductData(
      {this.ratingId,
        this.ratingUserId,
        this.ratingProductId,
        this.ratingValue});

  RatingCountProductData.fromJson(Map<String, dynamic> json) {
    ratingId = json['rating_id'];
    ratingUserId = json['rating_user_id'];
    ratingProductId = json['rating_product_id'];
    ratingValue = json['rating_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_id'] = this.ratingId;
    data['rating_user_id'] = this.ratingUserId;
    data['rating_product_id'] = this.ratingProductId;
    data['rating_value'] = this.ratingValue;
    return data;
  }
}
