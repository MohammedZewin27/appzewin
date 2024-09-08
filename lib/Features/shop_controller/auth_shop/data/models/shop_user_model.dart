class ShopCategoryModel {
  String? status;
  List<CategoriesData>? categoriesData;

  ShopCategoryModel({this.status, this.categoriesData});

  ShopCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories_data'] != null) {
      categoriesData = <CategoriesData>[];
      json['categories_data'].forEach((v) {
        categoriesData!.add(new CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categoriesData != null) {
      data['categories_data'] =
          this.categoriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  int? parentId;

  CategoriesData(
      {this.categoryId, this.categoryName, this.categoryImage, this.parentId});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    parentId = json['Parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] = this.categoryImage;
    data['Parent_id'] = this.parentId;
    return data;
  }
}


class ShopSubCategoryModel {
  String? status;
  List<SubCategoriesdata>? subCategoriesdata;

  ShopSubCategoryModel({this.status, this.subCategoriesdata});

  ShopSubCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['SubCategoriesdata'] != null) {
      subCategoriesdata = <SubCategoriesdata>[];
      json['SubCategoriesdata'].forEach((v) {
        subCategoriesdata!.add(new SubCategoriesdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.subCategoriesdata != null) {
      data['SubCategoriesdata'] =
          this.subCategoriesdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategoriesdata {
  int? subcategoriesId;
  String? subcategoriesTitle;
  String? subcategoriesImage;
  int? categoriesId;
  int? parentId;

  SubCategoriesdata(
      {this.subcategoriesId,
        this.subcategoriesTitle,
        this.subcategoriesImage,
        this.categoriesId,
        this.parentId});

  SubCategoriesdata.fromJson(Map<String, dynamic> json) {
    subcategoriesId = json['subcategories_id'];
    subcategoriesTitle = json['subcategories_title'];
    subcategoriesImage = json['subcategories_image'];
    categoriesId = json['categories_id'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcategories_id'] = this.subcategoriesId;
    data['subcategories_title'] = this.subcategoriesTitle;
    data['subcategories_image'] = this.subcategoriesImage;
    data['categories_id'] = this.categoriesId;
    data['parent_id'] = this.parentId;
    return data;
  }
}


// class ShopDataModel {
//   String? status;
//   ShopData? shopData;
//
//   ShopDataModel({this.status, this.shopData});
//
//   ShopDataModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     shopData = json['shopData'] != null
//         ? new ShopData.fromJson(json['shopData'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.shopData != null) {
//       data['shopData'] = this.shopData!.toJson();
//     }
//     return data;
//   }
// }
//
// class ShopData {
//   int? shopId;
//   String? shopName;
//   String? shopImage;
//   String? shopPhone;
//   String? shopAddress;
//   String? shopInformation;
//   String? locationShop;
//   String? specialOffer;
//   String? shopTimestart;
//   String? shopTimeend;
//   int? shopStatus;
//   int? subcategoriesId;
//   String? ratingShop;
//   String? passwordShop;
//   String? codeShop;
//   int? parentId;
//
//   ShopData(
//       {this.shopId,
//         this.shopName,
//         this.shopImage,
//         this.shopPhone,
//         this.shopAddress,
//         this.shopInformation,
//         this.locationShop,
//         this.specialOffer,
//         this.shopTimestart,
//         this.shopTimeend,
//         this.shopStatus,
//         this.subcategoriesId,
//         this.ratingShop,
//         this.passwordShop,
//         this.codeShop,
//         this.parentId});
//
//   ShopData.fromJson(Map<String, dynamic> json) {
//     shopId = json['shop_id'];
//     shopName = json['shop_name'];
//     shopImage = json['shop_image'];
//     shopPhone = json['shop_phone'];
//     shopAddress = json['shop_address'];
//     shopInformation = json['shop_Information'];
//     locationShop = json['location_shop'];
//     specialOffer = json['special_offer'];
//     shopTimestart = json['shop_timestart'];
//     shopTimeend = json['shop_timeend'];
//     shopStatus = json['shop_status'];
//     subcategoriesId = json['subcategories_id'];
//     ratingShop = json['rating_shop'];
//     passwordShop = json['password_shop'];
//     codeShop = json['code_shop'];
//     parentId = json['parent_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['shop_id'] = this.shopId;
//     data['shop_name'] = this.shopName;
//     data['shop_image'] = this.shopImage;
//     data['shop_phone'] = this.shopPhone;
//     data['shop_address'] = this.shopAddress;
//     data['shop_Information'] = this.shopInformation;
//     data['location_shop'] = this.locationShop;
//     data['special_offer'] = this.specialOffer;
//     data['shop_timestart'] = this.shopTimestart;
//     data['shop_timeend'] = this.shopTimeend;
//     data['shop_status'] = this.shopStatus;
//     data['subcategories_id'] = this.subcategoriesId;
//     data['rating_shop'] = this.ratingShop;
//     data['password_shop'] = this.passwordShop;
//     data['code_shop'] = this.codeShop;
//     data['parent_id'] = this.parentId;
//     return data;
//   }
// }


// class ShopDataActiveModel {
//   String? status;
//   ShopDate? shopDate;
//
//   ShopDataActiveModel({this.status, this.shopDate});
//
//   ShopDataActiveModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     shopDate = json['shop_date'] != null
//         ? new ShopDate.fromJson(json['shop_date'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.shopDate != null) {
//       data['shop_date'] = this.shopDate!.toJson();
//     }
//     return data;
//   }
// }
//
// class ShopDate {
//   int? shopId;
//   String? shopName;
//   String? shopImage;
//   String? shopPhone;
//   String? shopAddress;
//   String? shopInformation;
//   String? locationShop;
//   String? specialOffer;
//   String? shopTimestart;
//   String? shopTimeend;
//   int? shopStatus;
//   int? subcategoriesId;
//   String? ratingShop;
//   String? passwordShop;
//   String? codeShop;
//   int? parentId;
//
//   ShopDate(
//       {this.shopId,
//         this.shopName,
//         this.shopImage,
//         this.shopPhone,
//         this.shopAddress,
//         this.shopInformation,
//         this.locationShop,
//         this.specialOffer,
//         this.shopTimestart,
//         this.shopTimeend,
//         this.shopStatus,
//         this.subcategoriesId,
//         this.ratingShop,
//         this.passwordShop,
//         this.codeShop,
//         this.parentId});
//
//   ShopDate.fromJson(Map<String, dynamic> json) {
//     shopId = json['shop_id'];
//     shopName = json['shop_name'];
//     shopImage = json['shop_image'];
//     shopPhone = json['shop_phone'];
//     shopAddress = json['shop_address'];
//     shopInformation = json['shop_Information'];
//     locationShop = json['location_shop'];
//     specialOffer = json['special_offer'];
//     shopTimestart = json['shop_timestart'];
//     shopTimeend = json['shop_timeend'];
//     shopStatus = json['shop_status'];
//     subcategoriesId = json['subcategories_id'];
//     ratingShop = json['rating_shop'];
//     passwordShop = json['password_shop'];
//     codeShop = json['code_shop'];
//     parentId = json['parent_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['shop_id'] = this.shopId;
//     data['shop_name'] = this.shopName;
//     data['shop_image'] = this.shopImage;
//     data['shop_phone'] = this.shopPhone;
//     data['shop_address'] = this.shopAddress;
//     data['shop_Information'] = this.shopInformation;
//     data['location_shop'] = this.locationShop;
//     data['special_offer'] = this.specialOffer;
//     data['shop_timestart'] = this.shopTimestart;
//     data['shop_timeend'] = this.shopTimeend;
//     data['shop_status'] = this.shopStatus;
//     data['subcategories_id'] = this.subcategoriesId;
//     data['rating_shop'] = this.ratingShop;
//     data['password_shop'] = this.passwordShop;
//     data['code_shop'] = this.codeShop;
//     data['parent_id'] = this.parentId;
//     return data;
//   }
// }




