


import '../../../hiraj/data/models/hiraj_model.dart';
import '../../../home/data/models/home_model.dart';

class SearchModel {
  String? status;
  Shops? shops;
  HirajSeller? hirajSeller;
  Products? products;

  SearchModel({this.status, this.shops, this.hirajSeller, this.products});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    shops = json['shops'] != null ? Shops.fromJson(json['shops']) : null;
    hirajSeller = json['hiraj_seller'] != null
        ? HirajSeller.fromJson(json['hiraj_seller'])
        : null;
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (shops != null) {
      data['shops'] = shops!.toJson();
    }
    if (hirajSeller != null) {
      data['hiraj_seller'] = hirajSeller!.toJson();
    }
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}

