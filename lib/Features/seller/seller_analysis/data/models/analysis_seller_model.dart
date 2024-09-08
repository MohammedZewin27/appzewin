class AnalysisSellerModel {
  String? status;
  AnalysisSeller? analysisSeller;

  AnalysisSellerModel({this.status, this.analysisSeller});

  AnalysisSellerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    analysisSeller = json['analysis_seller'] != null
        ? new AnalysisSeller.fromJson(json['analysis_seller'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.analysisSeller != null) {
      data['analysis_seller'] = this.analysisSeller!.toJson();
    }
    return data;
  }
}

class AnalysisSeller {
  List<LocationSellerData>? locationSellerData;
  List<SharingSellerData>? sharingSellerData;
  List<CallSellerData>? callSellerData;
  List<WhatsAppSellerData>? whatsAppSellerData;
  List<FavoriteSellerData>? favoriteSellerData;
  List<EntrySellerData>? entrySellerData;

  AnalysisSeller(
      {this.locationSellerData,
        this.sharingSellerData,
        this.callSellerData,
        this.whatsAppSellerData,
        this.favoriteSellerData,
        this.entrySellerData});

  AnalysisSeller.fromJson(Map<String, dynamic> json) {
    if (json['locationSellerData'] != null) {
      locationSellerData = <LocationSellerData>[];
      json['locationSellerData'].forEach((v) {
        locationSellerData!.add(new LocationSellerData.fromJson(v));
      });
    }
    if (json['sharingSellerData'] != null) {
      sharingSellerData = <SharingSellerData>[];
      json['sharingSellerData'].forEach((v) {
        sharingSellerData!.add(new SharingSellerData.fromJson(v));
      });
    }
    if (json['callSellerData'] != null) {
      callSellerData = <CallSellerData>[];
      json['callSellerData'].forEach((v) {
        callSellerData!.add(new CallSellerData.fromJson(v));
      });
    }
    if (json['whatsAppSellerData'] != null) {
      whatsAppSellerData = <WhatsAppSellerData>[];
      json['whatsAppSellerData'].forEach((v) {
        whatsAppSellerData!.add(new WhatsAppSellerData.fromJson(v));
      });
    }
    if (json['favoriteSellerData'] != null) {
      favoriteSellerData = <FavoriteSellerData>[];
      json['favoriteSellerData'].forEach((v) {
        favoriteSellerData!.add(new FavoriteSellerData.fromJson(v));
      });
    }
    if (json['entrySellerData'] != null) {
      entrySellerData = <EntrySellerData>[];
      json['entrySellerData'].forEach((v) {
        entrySellerData!.add(new EntrySellerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locationSellerData != null) {
      data['locationSellerData'] =
          this.locationSellerData!.map((v) => v.toJson()).toList();
    }
    if (this.sharingSellerData != null) {
      data['sharingSellerData'] =
          this.sharingSellerData!.map((v) => v.toJson()).toList();
    }
    if (this.callSellerData != null) {
      data['callSellerData'] =
          this.callSellerData!.map((v) => v.toJson()).toList();
    }
    if (this.whatsAppSellerData != null) {
      data['whatsAppSellerData'] =
          this.whatsAppSellerData!.map((v) => v.toJson()).toList();
    }
    if (this.favoriteSellerData != null) {
      data['favoriteSellerData'] =
          this.favoriteSellerData!.map((v) => v.toJson()).toList();
    }
    if (this.entrySellerData != null) {
      data['entrySellerData'] =
          this.entrySellerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationSellerData {
  int? locationSellerId;
  String? locationSellerData;
  int? locationSellerSellerId;
  int? locationSellerUserId;

  LocationSellerData(
      {this.locationSellerId,
        this.locationSellerData,
        this.locationSellerSellerId,
        this.locationSellerUserId});

  LocationSellerData.fromJson(Map<String, dynamic> json) {
    locationSellerId = json['location_seller_id'];
    locationSellerData = json['location_seller_data'];
    locationSellerSellerId = json['location_seller_seller_id'];
    locationSellerUserId = json['location_seller_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_seller_id'] = this.locationSellerId;
    data['location_seller_data'] = this.locationSellerData;
    data['location_seller_seller_id'] = this.locationSellerSellerId;
    data['location_seller_user_id'] = this.locationSellerUserId;
    return data;
  }
}

class SharingSellerData {
  int? sharingSellerId;
  String? sharingSelleDate;
  int? sharingSelleSellerId;
  int? sharingSelleUserId;

  SharingSellerData(
      {this.sharingSellerId,
        this.sharingSelleDate,
        this.sharingSelleSellerId,
        this.sharingSelleUserId});

  SharingSellerData.fromJson(Map<String, dynamic> json) {
    sharingSellerId = json['sharing_seller_id'];
    sharingSelleDate = json['sharing_selle_date'];
    sharingSelleSellerId = json['sharing_selle_seller_id'];
    sharingSelleUserId = json['sharing_selle_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sharing_seller_id'] = this.sharingSellerId;
    data['sharing_selle_date'] = this.sharingSelleDate;
    data['sharing_selle_seller_id'] = this.sharingSelleSellerId;
    data['sharing_selle_user_id'] = this.sharingSelleUserId;
    return data;
  }
}

class CallSellerData {
  int? callId;
  String? callSelleDate;
  int? callSelleSellerId;
  int? callSelleUserId;

  CallSellerData(
      {this.callId,
        this.callSelleDate,
        this.callSelleSellerId,
        this.callSelleUserId});

  CallSellerData.fromJson(Map<String, dynamic> json) {
    callId = json['call_id'];
    callSelleDate = json['call_selle_date'];
    callSelleSellerId = json['call_selle_seller_id'];
    callSelleUserId = json['call_selle_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['call_id'] = this.callId;
    data['call_selle_date'] = this.callSelleDate;
    data['call_selle_seller_id'] = this.callSelleSellerId;
    data['call_selle_user_id'] = this.callSelleUserId;
    return data;
  }
}

class WhatsAppSellerData {
  int? whatsappSellerId;
  String? whatsappSellerData;
  int? whatsappSellerSellerId;
  int? whatsappSellerUserId;

  WhatsAppSellerData(
      {this.whatsappSellerId,
        this.whatsappSellerData,
        this.whatsappSellerSellerId,
        this.whatsappSellerUserId});

  WhatsAppSellerData.fromJson(Map<String, dynamic> json) {
    whatsappSellerId = json['whatsapp_seller_id'];
    whatsappSellerData = json['whatsapp_seller_data'];
    whatsappSellerSellerId = json['whatsapp_seller_seller_id'];
    whatsappSellerUserId = json['whatsapp_seller_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whatsapp_seller_id'] = this.whatsappSellerId;
    data['whatsapp_seller_data'] = this.whatsappSellerData;
    data['whatsapp_seller_seller_id'] = this.whatsappSellerSellerId;
    data['whatsapp_seller_user_id'] = this.whatsappSellerUserId;
    return data;
  }
}

class FavoriteSellerData {
  int? favoriteSellerId;
  String? favoriteDateSeller;
  int? favoriteSellerUserid;
  int? favoriteSellerSellerid;
  int? favoriteSellerParentid;

  FavoriteSellerData(
      {this.favoriteSellerId,
        this.favoriteDateSeller,
        this.favoriteSellerUserid,
        this.favoriteSellerSellerid,
        this.favoriteSellerParentid});

  FavoriteSellerData.fromJson(Map<String, dynamic> json) {
    favoriteSellerId = json['favorite_seller_id'];
    favoriteDateSeller = json['favorite_date_seller'];
    favoriteSellerUserid = json['favorite_seller_userid'];
    favoriteSellerSellerid = json['favorite_seller_sellerid'];
    favoriteSellerParentid = json['favorite_seller_parentid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_seller_id'] = this.favoriteSellerId;
    data['favorite_date_seller'] = this.favoriteDateSeller;
    data['favorite_seller_userid'] = this.favoriteSellerUserid;
    data['favorite_seller_sellerid'] = this.favoriteSellerSellerid;
    data['favorite_seller_parentid'] = this.favoriteSellerParentid;
    return data;
  }
}

class EntrySellerData {
  int? idEntrySeller;
  String? entryDateSeller;
  int? sellerIdEntry;
  int? userIdEntry;

  EntrySellerData(
      {this.idEntrySeller,
        this.entryDateSeller,
        this.sellerIdEntry,
        this.userIdEntry});

  EntrySellerData.fromJson(Map<String, dynamic> json) {
    idEntrySeller = json['id_entry_seller'];
    entryDateSeller = json['entry_date_seller'];
    sellerIdEntry = json['seller_id_entry'];
    userIdEntry = json['user_id_entry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_entry_seller'] = this.idEntrySeller;
    data['entry_date_seller'] = this.entryDateSeller;
    data['seller_id_entry'] = this.sellerIdEntry;
    data['user_id_entry'] = this.userIdEntry;
    return data;
  }
}
