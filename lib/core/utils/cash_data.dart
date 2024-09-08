import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;

  static void cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static void deleteItem({required String key}) {
    sharedPreferences.remove(key);
  }

  static void clearItem() {
    sharedPreferences.clear();
  }

  static void clearUserItems() {
    deleteItem(key: StringCache.idParent);
    deleteItem(key: StringCache.appLogo);
    deleteItem(key: StringCache.backgroundImage);
    deleteItem(key: StringCache.parentName);
    deleteItem(key: StringCache.appDescription);
    deleteItem(key: StringCache.userName);
    deleteItem(key: StringCache.userEmail);
    deleteItem(key: StringCache.userPhone);
    deleteItem(key: StringCache.userId);
    deleteItem(key: StringCache.activeUser);
    deleteItem(key: StringCache.userActiveSignIn);
  }

  static void clearSellerItems() {
    deleteItem(key: StringCache.sellerActive);
    deleteItem(key: StringCache.idSeller);
    deleteItem(key: StringCache.sellerStatus);
  }
  static void clearShopItems() {
    deleteItem(key: StringCache.shopActive);
    deleteItem(key: StringCache.idShop);
    deleteItem(key: StringCache.sellerStatus);
  }
}

class StringCache {
  /// user
  static const String idParent = 'idParent';
  static const String appLogo = 'appLogo';
  static const String backgroundImage = 'backgroundImage';
  static const String parentName = 'parentName';
  static const String appDescription = 'appDescription';
  static const String userName = 'userName';
  static const String userEmail = 'userEmail';
  static const String userPhone = 'userPhone';
  static const String userId = 'userId';
  static const String activeUser = 'activeUser';
  static const String userActiveSignIn = 'userActiveSignIn';

  /// seller
  static const String sellerActive = 'sellerActive';
  static const String idSeller = 'idSeller';
  static const String sellerStatus = 'sellerStatus';

  /// Shop
  static const String shopActive = 'shopActive';
  static const String idShop = 'idShop';
  static const String shopStatus = 'shopStatus';

  /// user value
  static bool active = CacheData.getData(key: activeUser) ?? false;
  static bool activeSignIn = CacheData.getData(key: userActiveSignIn) ?? false;

  /// seller value
  static String statusSellerString = CacheData.getData(key: sellerStatus) ?? '0';
  static bool activeSeller = CacheData.getData(key: sellerActive) ?? false;

  /// shop value
  static int statusShopInt = CacheData.getData(key: shopStatus) ?? 0;
  static bool activeShop = CacheData.getData(key: shopActive) ?? false;
}
