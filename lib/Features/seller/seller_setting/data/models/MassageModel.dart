class MassageModel {
  String? status;
  String? massage;

  MassageModel({this.status, this.massage});

  MassageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['massage'] = this.massage;
    return data;
  }
}
