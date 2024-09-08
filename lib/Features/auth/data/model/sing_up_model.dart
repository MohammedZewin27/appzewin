class SingUpModel {
  String? status;
  String? message;
  UserData? userData;

  SingUpModel({this.status, this.userData});

  SingUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message  = json['message'];
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  int? userVerfycode;
  String? userCreate;
  int? userActive;

  UserData(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userPassword,
      this.userVerfycode,
      this.userCreate,
      this.userActive});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userPassword = json['user_password'];
    userVerfycode = json['user_verfycode'];
    userCreate = json['user_create'];
    userActive = json['user_active'];
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
    return data;
  }
}



class LoginModel {
  String? status;
  String? message;
  UserData? userData;

  LoginModel({this.status, this.message, this.userData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}




class VerifyCode {
  String? status;
  String? message;
  UserData? userData;

  VerifyCode({this.status, this.message, this.userData});

  VerifyCode.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['userData'] != null
        ? UserData.fromJson(json['userData'])
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


class MassageModel {
  String? status;
  String? message;

  MassageModel({this.status, this.message});

  MassageModel.fromJson(Map<String, dynamic> json) {
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
