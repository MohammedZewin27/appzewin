class UserDataModel {
  String? status;
  String? message;
  UserDataSetting? userData;

  UserDataModel({this.status, this.message, this.userData});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['userData'] != null
        ? UserDataSetting.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userData != null) {
      data['userData'] = userData!.toJson();
    }
    return data;
  }
}

class UserDataSetting {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  int? userVerfycode;
  String? userCreate;
  int? userActive;
  int? idParent;

  UserDataSetting(
      {this.userId,
        this.userName,
        this.userEmail,
        this.userPhone,
        this.userPassword,
        this.userVerfycode,
        this.userCreate,
        this.userActive,
        this.idParent});

  UserDataSetting.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userPassword = json['user_password'];
    userVerfycode = json['user_verfycode'];
    userCreate = json['user_create'];
    userActive = json['user_active'];
    idParent = json['id_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_phone'] = userPhone;
    data['user_password'] = userPassword;
    data['user_verfycode'] = userVerfycode;
    data['user_create'] = userCreate;
    data['user_active'] = userActive;
    data['id_parent'] = idParent;
    return data;
  }
}


class MassageRequestModel {
  String? status;
  String? message;

  MassageRequestModel({this.status, this.message});

  MassageRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

