import '../../../Features/Layout/data/models/dialog_advertisement_model.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const double elevation0 = 0;
  static const int sliderAnimationTime = 300;
}



Map isFavoriteProduct = {};
Map isFavoriteSeller = {};
Map isFavoriteShop = {};

class FavoriteIsSelected {
  static setFavoriteProduct(idProduct, value) {
    isFavoriteProduct[idProduct] = value;
  }

  static setFavoriteSeller({required idSeller, required value}) {
    isFavoriteSeller[idSeller] = value;
  }

  static setFavoriteShop({required idProduct, required value}) {
    isFavoriteShop[idProduct] = value;
  }
}



List<DialogadvertisementData> dialogAdvertisementData=[];


int switchScreen=0;