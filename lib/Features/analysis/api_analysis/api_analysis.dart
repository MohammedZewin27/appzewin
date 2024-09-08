import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

const String _linkServerName = "https://artawiya.com/DigitalArtawiya";
// const String linkServerName = "http://192.168.0.127/DigitalArtawiya/";
const String linkImage = "$_linkServerName/upload/";
const String launchPolicy = "https://artawiya.com/";

///view all category
const String linkViewAll = "$_linkServerName/viewAll.php";

class ApiAnalysis {
  // final _baseUrl="http://192.168.0.127/DigitalArtawiya/";
  final _baseUrl = "https://artawiya.com//DigitalArtawiya/";

  final Dio dio;

  ApiAnalysis(this.dio);

  /// entry interactions product
  Future<Map<String, dynamic>> entryInteractionsProduct({
    required String endPoint,
    required int idSeller,
    required int idProduct,
     int? idUser,
  }) async {
    try {
      var data = FormData.fromMap({
        'seller_id': idSeller.toString(),
        'product_id': idProduct.toString(),
        'user_id': idUser.toString(),
      });

      var response = await dio.request(
        '$_baseUrl$endPoint',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
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
  ///  analysisEntrySeller
  Future<Map<String, dynamic>> analysisEntrySeller({
    required String endPoint,
    required int idSeller,
    int? idUser,
  }) async {
    try {
      var data = FormData.fromMap({
        'seller_id': idSeller.toString(),
        'user_id': idUser.toString(),
      });

      var response = await dio.request(
        '$_baseUrl$endPoint',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
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
/// analysis product
  Future<Map<String, dynamic>> analysisAddProduct({
    required String endPoint,
    required int productId,
    required int sellerId,
    int? idUser,
  }) async {
    try {
      var data = FormData.fromMap({
        'product_id': productId.toString(),
        "seller_id":sellerId.toString(),

        'user_id': idUser.toString(),
      });

      var response = await dio.request(
        '$_baseUrl$endPoint',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
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

  /// get full analysis seller
  Future<Map<String, dynamic>> getFullAnalysisSeller({
    required String endPoint,
    required int idSeller,

  }) async {
    try {
      var data = FormData.fromMap({
        'seller_id': idSeller.toString(),
      });

      var response = await dio.request(
        '$_baseUrl$endPoint',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
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
