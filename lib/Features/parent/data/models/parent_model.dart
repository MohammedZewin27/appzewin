class ParentModel {
  String? status;
  List<DataParent>? dataParent;

  ParentModel({this.status, this.dataParent});

  ParentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['dataParent'] != null) {
      dataParent = <DataParent>[];
      json['dataParent'].forEach((v) {
        dataParent!.add(DataParent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dataParent != null) {
      data['dataParent'] = dataParent!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataParent {
  int? id;
  String? name;
  String? appLogo;
  String? backgroundImage;
  String? appDescription;

  DataParent(
      {this.id,
        this.name,
        this.appLogo,
        this.backgroundImage,
        this.appDescription});

  DataParent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    appLogo = json['app_logo'];
    backgroundImage = json['background_image'];
    appDescription = json['app_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['app_logo'] = appLogo;
    data['background_image'] = backgroundImage;
    data['app_description'] = appDescription;
    return data;
  }
}
