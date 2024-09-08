import '../../seller_post/data/models/post_seller_model.dart';
import '../const.dart';

void getPostActive(List<ProductsSeller> listProducts) {
  postActive = [];
  postUnActive = [];

  for (var product in listProducts) {
    if (product.statusProduct == 1) {
      print(1);
      postActive.add(product);
    } else if (product.statusProduct == 0) {
      postUnActive.add(product);
      print(0);
    }
  }
}
