import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

const String _linkServerName = "https://artawiya.com/DigitalArtawiya";
// const String linkServerName = "http://192.168.0.127/DigitalArtawiya/";
const String linkImage = "$_linkServerName/upload/";

///view all category
const String linkViewAll = "$_linkServerName/viewAll.php";

class ApiServiceSeller {
  // final _baseUrl="http://192.168.0.127/DigitalArtawiya/";
  final _baseUrl = "https://artawiya.com//DigitalArtawiya/";

  final Dio dio;

  ApiServiceSeller(this.dio);
  Future<Map<String, dynamic>> getSellerWithPassword(
      {required String endPoint, String? codeSeller,String? passwordSelle}) async {
    var data = FormData.fromMap({'code_seller': codeSeller,'password_selle':passwordSelle});

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
  Future<Map<String, dynamic>> getPostSeller(
      {required String endPoint, int? idSeller}) async {
    var data = FormData.fromMap({'id_seller_product': idSeller});

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
  Future<Map<String, dynamic>> getImagesPostSeller(
      {required String endPoint, int? productId}) async {
    var data = FormData.fromMap({'product_id': productId});

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
  Future<Map<String, dynamic>> addProduct({
    required String endPoint,
    required String parameterImageProduct,
    required String parameterTitleProduct,
    required String parameterDetailsProduct,
    required String parameterNewPriceProduct,
    required String parameterOldPriceProduct,
    required String parameterQualityProduct,
    required String parameterDeliveryService,
    required String parameterStatusProduct,
    required String parameterEndProduct,
    required String parameterRatingProduct,
    required String parameterIdSellerProduct,
    required String parameterParentId,
    required String titleProduct,
    required String detailsProduct,
    required String newPriceProduct,
    required String oldPriceProduct,
    required String qualityProduct,
    required String deliveryService,
    required String statusProduct,
    required String endProduct,
    required String ratingProduct,
    required int idSellerProduct,
    required int parentId,
    required File imageProduct,
  }) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        parameterTitleProduct: titleProduct,
        parameterDetailsProduct: detailsProduct,
        parameterNewPriceProduct: newPriceProduct,
        parameterOldPriceProduct: oldPriceProduct,
        parameterQualityProduct: qualityProduct,
        parameterDeliveryService: deliveryService,
        parameterStatusProduct: statusProduct,
        parameterEndProduct: endProduct,
        parameterRatingProduct: ratingProduct,
        parameterIdSellerProduct: '$idSellerProduct',
        parameterParentId: '$parentId',
      });
      request.files.add(await http.MultipartFile.fromPath(
          parameterImageProduct, imageProduct.path));

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

  /// update product
  Future<Map<String, dynamic>> updateProduct2({
    required String endPoint,
    // required String parameterImageProduct,
    required String parameterTitleProduct,
    required String parameterDetailsProduct,
    required String parameterNewPriceProduct,
    required String parameterOldPriceProduct,
    required String parameterQualityProduct,
    required String parameterDeliveryService,
    required String parameterStatusProduct,
    required String parameterIdSellerProduct,
    required String parameterOldImage,
    required String titleProduct,
    required String detailsProduct,
    required String newPriceProduct,
    required String oldPriceProduct,
    required String qualityProduct,
    required String deliveryService,
    required String statusProduct,
    required String oldImage,
    required int idSellerProduct,
    // required File newImageProduct,
  }) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        parameterTitleProduct: titleProduct,
        parameterDetailsProduct: detailsProduct,
        parameterNewPriceProduct: newPriceProduct,
        parameterOldPriceProduct: oldPriceProduct,
        parameterQualityProduct: qualityProduct,
        parameterDeliveryService: deliveryService,
        parameterStatusProduct: statusProduct,
        parameterOldImage: oldImage
        // parameterEndProduct: endProduct,
        // parameterRatingProduct: ratingProduct,
        // parameterIdSellerProduct: '$idSellerProduct',
        //  parameterParentId: '$parentId',
      });
      // request.files.add(await http.MultipartFile.fromPath(
      //     parameterImageProduct, newImageProduct.path));

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

  updateProduct({
    required String endPoint,
    required String titleProduct,
    required String detailsProduct,
    required String newPriceProduct,
    required String oldPriceProduct,
    required String qualityProduct,
    required String deliveryService,
    required String statusProduct,
    required String oldImage,
    required int idSellerProduct,
    File? newImage
}) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '$_baseUrl$endPoint'));
      request.fields.addAll({
        'id': '$idSellerProduct',
        'title': titleProduct,
        'details': detailsProduct,
        'price': oldPriceProduct,
        'new_price': newPriceProduct,
        'quality': qualityProduct,
        'delivery':deliveryService,
        'status': statusProduct,
        'imagename': oldImage
      });
      if (newImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'newImage', newImage.path));
      }
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('Error occurred: $error');
      rethrow;
    }
  }



  Future<Map<String, dynamic>> addImagesProduct({
    required String endPoint,
    required String parameterImageProduct,
    required String parameterProductId,

    required int productId,
    required File? imageProduct,
  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        parameterProductId: productId.toString(),

      });
      if (imageProduct != null) {
        request.files.add(await http.MultipartFile.fromPath(
            parameterImageProduct, imageProduct.path));
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

  Future<Map<String, dynamic>> deleteImageFromMoreImages({
    required String endPoint,
    required String parameterImageId,
    required String parameterImageName,

  required String imageId,
  required String imageName,
  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        parameterImageId: imageId,
        parameterImageName: imageName,

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
  Future<Map<String, dynamic>> deleteProductFromSeller({
    required String endPoint,
    required String parameterProductId,
    required String parameterImageName,

    required String productId,
    required String imageName,
  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        parameterProductId: productId,
        parameterImageName: imageName,

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

  Future<Map<String, dynamic>> changeStatusSeller({
    required String endPoint,
    required int idSeller,


  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        'id_seller': '$idSeller',
        'seller_status': '0',

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
  Future<Map<String, dynamic>> getFullAnalysisProduct({
    required String endPoint,
    required int productId,

  }) async {
    try {
      var data = FormData.fromMap({
        'product_id': productId.toString(),
      });

      var response = await dio.request(
        '$_baseUrl$endPoint',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        // print(json.encode(response.data));
        return response.data;
      } else {
        print('Error: ${response.statusMessage}');
        return {'error': response.statusMessage};
      }
    } catch (e) {
      print('Exception: $e');
      return {'error': e.toString()};
    }
  }

}
