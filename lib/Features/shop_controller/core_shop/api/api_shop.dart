

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

const String _linkServerName = "https://artawiya.com/DigitalArtawiya";
// const String linkServerName = "http://192.168.0.127/DigitalArtawiya/";
const String linkImage = "$_linkServerName/upload/";

///view all category
const String linkViewAll = "$_linkServerName/viewAll.php";

class ApiShop {
  // final _baseUrl="http://192.168.0.127/DigitalArtawiya/";
  final _baseUrl = "https://artawiya.com//DigitalArtawiya/";

  final Dio dio;

  ApiShop(this.dio);
  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    var response = await dio.get('$_baseUrl$endPoint');

    print('response ------>${response.statusMessage}');
    return response.data;
  }
  ///
  Future<Map<String, dynamic>> getCategory(
      {required String endPoint, int? parentId}) async {
    var data = FormData.fromMap({'parent_Id': parentId});

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
    return response.data;
  }
  ///
  Future<Map<String, dynamic>> getSubCategory(
      {required String endPoint, int? categoriesId}) async {
    var data = FormData.fromMap({'categories_id': categoriesId});

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
    return response.data;
  }
  ///
  Future<Map<String, dynamic>> getShopUser(
      {required String endPoint, required String shopCode,required String shopPassword}) async {
    var data = FormData.fromMap({'shopCode': shopCode,'shopPassword':shopPassword});

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
    return response.data;
  }
  ///
  Future<Map<String, dynamic>> getWithIdShop({
    required String endPoint,
    required int shopId,
  }) async {
    var data = FormData.fromMap({
      'shopId': shopId,
    });

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }

    return response.data as Map<String, dynamic>;
  }
///
  Future<Map<String, dynamic>> getImagesShopUser({
    required String endPoint,
    required int shopId,
  }) async {
    var data = FormData.fromMap({
      'shop_id': shopId,
    });

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }

    return response.data as Map<String, dynamic>;
  }
  ///
  Future<Map<String, dynamic>> getServicesShopUser({
    required String endPoint,
    required int shopId,
  }) async {
    var data = FormData.fromMap({
      'shop_id': shopId,
    });

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }

    return response.data as Map<String, dynamic>;
  }
  ///
  Future<Map<String, dynamic>> addServicesShopUser({
    required String endPoint,
    required String shopServices,
    required int shopId,
  }) async {
    var data = FormData.fromMap({
      'shop_id': shopId,
      'shop_services': shopServices,
    });

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }

    return response.data as Map<String, dynamic>;
  }
  ///
  Future<Map<String, dynamic>> deleteServicesShopUser({
    required String endPoint,

    required int servicesId,
  }) async {
    var data = FormData.fromMap({
      'services_id': servicesId,

    });

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }

    return response.data as Map<String, dynamic>;
  }
  ///
  Future<Map<String, dynamic>> addImagesShopUser({
    required String endPoint,
    required int shopId,
     File? shopImage,
  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        'shop_id': '$shopId',

      });
      if (shopImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'shop_imageUrl', shopImage.path));
      }
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseBody);
        return responseData;
      } else {
        throw Exception(
            'Failed to upload data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
      rethrow;
    }

  }
  ///
  Future<Map<String, dynamic>> changeStatusShop({
    required String endPoint,
    required int shopId,


  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        'shop_id': '$shopId',
        'shop_status': '0',

      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseBody);
        return responseData;
      } else {
        throw Exception(
            'Failed to upload data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
      rethrow;
    }
  }
    ///
  Future<Map<String, dynamic>> deleteImagesShopUser({
    required String endPoint,
    required int imageId,
    required String imageShop,
  }) async {
    var data = FormData.fromMap({
      'shop_image_id': imageId,
      'image_name': imageShop,
    });

    var dio = Dio();
    var response = await dio.request(
      '$_baseUrl$endPoint',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }

    return response.data as Map<String, dynamic>;
  }
///
  Future<Map<String, dynamic>> addShopUser({
    required String endPoint,
    required String shopName,
    required String shopPhone,
    required String shopAddress,
    required String shopInformation,
    required String shopTimeEnd,
    required int? shopStatus,
    required String subCategoriesId,
    required String passwordShop,
    required String shopLocation,
    required int? parentId,
    required File imageProduct,
  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        'shop_name': shopName,
        'shop_phone': shopPhone,
        'shop_address': shopAddress,
        'shop_Information': shopInformation,
        'shop_timeend': shopTimeEnd,
        'shop_status': '$shopStatus',
        'subcategories_id': subCategoriesId,
        'parent_id': '$parentId',
        'special_offer':'null',
        'passwordShop':passwordShop,
        'shop_location':shopLocation,
      });
      request.files.add(await http.MultipartFile.fromPath(
          'shop_image', imageProduct.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseBody);
        return responseData;
      } else {
        throw Exception(
            'Failed to upload data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
      rethrow;
    }
  }
  ///


  Future<Map<String, dynamic>> upDateShopUser({
    required String endPoint,
    required int shopId,
    required String shopPhone,
    required String shopAddress,
    required String shopInformation,
    required String oldShopImage,


     File? newImageShop,
  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        'shop_id': '$shopId',
        'shop_phone': shopPhone,
        'shop_address': shopAddress,
        'shop_Information': shopInformation,
        'shop_image':oldShopImage
      });
      if (newImageShop != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'newImage', newImageShop.path));
      }


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> responseData = json.decode(responseBody);
        return responseData;
      } else {
        throw Exception(
            'Failed to upload data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
      rethrow;
    }
  }


}
