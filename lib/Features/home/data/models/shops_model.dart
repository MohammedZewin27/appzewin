// class Parent {
//   String? status;
//   ShopsRating? shopsRating;
//
//   Parent({this.status, this.shopsRating});
//
//   Parent.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     shopsRating = json['shops_rating'] != null
//         ? new ShopsRating.fromJson(json['shops_rating'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.shopsRating != null) {
//       data['shops_rating'] = this.shopsRating!.toJson();
//     }
//     return data;
//   }
// }