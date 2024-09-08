class DialogAdvertisementModel {
  Dialogadvertisement? dialogadvertisement;

  DialogAdvertisementModel({this.dialogadvertisement});

  DialogAdvertisementModel.fromJson(Map<String, dynamic> json) {
    dialogadvertisement = json['dialogadvertisement'] != null
        ? Dialogadvertisement.fromJson(json['dialogadvertisement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dialogadvertisement != null) {
      data['dialogadvertisement'] = dialogadvertisement!.toJson();
    }
    return data;
  }
}

class Dialogadvertisement {
  String? status;
  List<DialogadvertisementData>? dialogadvertisementData;

  Dialogadvertisement({this.status, this.dialogadvertisementData});

  Dialogadvertisement.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['dialogadvertisement_data'] != null) {
      dialogadvertisementData = <DialogadvertisementData>[];
      json['dialogadvertisement_data'].forEach((v) {
        dialogadvertisementData!.add(DialogadvertisementData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (dialogadvertisementData != null) {
      data['dialogadvertisement_data'] =
          dialogadvertisementData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DialogadvertisementData {
  int? idDialogAdvertisement;
  String? titleDialogAdvertisement;
  String? imageDialogAdvertisement;
  String? startDialogAdvertisement;
  String? endDialogAdvertisement;
  int? parentId;

  DialogadvertisementData(
      {this.idDialogAdvertisement,
        this.titleDialogAdvertisement,
        this.imageDialogAdvertisement,
        this.startDialogAdvertisement,
        this.endDialogAdvertisement,
        this.parentId});

  DialogadvertisementData.fromJson(Map<String, dynamic> json) {
    idDialogAdvertisement = json['id_dialog_advertisement'];
    titleDialogAdvertisement = json['title_dialog_advertisement'];
    imageDialogAdvertisement = json['image_dialog_advertisement'];
    startDialogAdvertisement = json['start_dialog_advertisement'];
    endDialogAdvertisement = json['end_dialog_advertisement'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_dialog_advertisement'] = idDialogAdvertisement;
    data['title_dialog_advertisement'] = titleDialogAdvertisement;
    data['image_dialog_advertisement'] = imageDialogAdvertisement;
    data['start_dialog_advertisement'] = startDialogAdvertisement;
    data['end_dialog_advertisement'] = endDialogAdvertisement;
    data['parent_id'] = parentId;
    return data;
  }
}
