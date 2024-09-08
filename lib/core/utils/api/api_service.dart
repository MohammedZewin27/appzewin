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

class ApiService {
  // final _baseUrl="http://192.168.0.127/DigitalArtawiya/";
  final _baseUrl = "https://artawiya.com//DigitalArtawiya/";

  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    var response = await dio.get('$_baseUrl$endPoint');

    print('response ------>${response.statusMessage}');
    return response.data;
  }

  /// add massage
  Future<Map<String, dynamic>> addUserMassage({
    required String endPoint,
    required String userId,
    required String title,
    required String subject,
    required String type,
  }) async {
    var data = FormData.fromMap({
      'user_id': userId,
      'title': title,
      'subject': subject,
      'type': type,
    });
    var response = await dio.request('$_baseUrl$endPoint',
        options: Options(method: 'POST'), data: data);

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
    return response.data;
  }
///
  Future<Map<String, dynamic>> getSeller(
      {required String endPoint, int? idSeller}) async {
    var data = FormData.fromMap({'id_seller': idSeller});

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

  /// get Search
  Future<Map<String, dynamic>> getSearch(
      {required String endPoint, String? search, int? parentId}) async {
    var data = FormData.fromMap({'search': search, 'parent_id': parentId});

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
  Future<Map<String, dynamic>> getCategory(
      {required String endPoint, int? parentId}) async {
    var data = FormData.fromMap({'id_parent': parentId});

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
  Future<Map<String, dynamic>> deleteUser({
    required String endPoint,
    String? emailOrPhoneOrIdUser,
    required String parameter,
  }) async {
    var data = FormData.fromMap({parameter: emailOrPhoneOrIdUser});

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

  Future<Map<String, dynamic>> deleteUserActive({
    required String endPoint,
    required String? userId,
    required String? userPassword,
  }) async {
    var data = FormData.fromMap({
      'user_id': userId,
      'user_password': userPassword,
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
    return response.data;
  }

  Future<Map<String, dynamic>> sendCodeToMail({
    required String endPoint,
    String? email,
    required String parameter,
  }) async {
    var data = FormData.fromMap({parameter: email});

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

  /// service Request
  Future<Map<String, dynamic>> serviceRequest({
    required String endPoint,
    required String? email,
    required String? phone,
    required String? text,
  }) async {
    var data = FormData.fromMap({
      'email': email,
      'phone': phone,
      'text': text,
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
    return response.data;
  }

  Future<Map<String, dynamic>> changePassword({
    required String endPoint,
    String? email,
    String? verifyCode,
    String? userPassword,
    required String parameterMail,
    required String parameterVerifyCode,
    required String parameterUserPassword,
  }) async {
    var data = FormData.fromMap({
      parameterMail: email,
      parameterVerifyCode: verifyCode,
      parameterUserPassword: userPassword,
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
    return response.data;
  }

  Future<Map<String, dynamic>> getWithParentId(
      {required String endPoint,
      required int? parentId,
      required int? userid}) async {
    var data = FormData.fromMap({
      'parent_id': parentId,
      'userid': userid,
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
    } else {
      print(response.statusMessage);
    }
    return response.data;
  }

  /// update User
  Future<Map<String, dynamic>> updateUser(
      {required String endPoint,
      required int? userId,
      required String? userPhone,
      required String? userName}) async {
    var data = FormData.fromMap({
      'user_id': userId,
      'user_name': userName,
      'user_phone': userPhone,
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
    } else {
      print(response.statusMessage);
    }
    return response.data;
  }

  /// get user

  Future<Map<String, dynamic>> getUserData({
    required String endPoint,
    required int? userId,
  }) async {
    var data = FormData.fromMap({
      'user_id': userId,
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
    } else {
      print(response.statusMessage);
    }
    return response.data;
  }

  /// add User
  Future<Map<String, dynamic>> addUser(
      {required int idParent,
      required userName,
      required userPhone,
      required userPassword,
      required String endPoint,
      required userEmail}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'user_name': userName,
      'user_phone': userPhone,
      'user_password': userPassword,
      'user_email': userEmail,
      'id_parent': '$idParent'
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///
  Future<Map<String, dynamic>> productRating({
    required int userid,
    required int productId,
    required double ratingValue,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'userid': '$userid',
      'productid': '$productId',
      'value': '$ratingValue',
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///     favoriteProducts
  Future<Map<String, dynamic>> favoriteProducts({
    required int userid,
    required int idParent,
    required int productId,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'userid': '$userid',
      'productid': '$productId',
      'parent_id': '$idParent'
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///         favoriteSeller
  Future<Map<String, dynamic>> favoriteSeller({
    required int userid,
    required int sellerId,
    required int idParent,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'userid': '$userid',
      'sellerId': '$sellerId',
      'parent_id': '$idParent'
    });
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///         favoriteShop
  Future<Map<String, dynamic>> favoriteShop({
    required int userid,
    required int shopId,
    required int idParent,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll(
        {'userid': '$userid', 'shop_id': '$shopId', 'parent_id': '$idParent'});
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///
  Future<Map<String, dynamic>> favoriteView({
    required int userid,
    required int parentId,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({'userid': '$userid', 'parent_id': '$parentId'});
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///
  Future<Map<String, dynamic>> favoriteDelete({
    required int userid,
    required int sellerIdOrShopOrProduct,
    required String prametarId,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'userid': '$userid',
      prametarId: '$sellerIdOrShopOrProduct',
    });
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///
  Future<Map<String, dynamic>> shopRating({
    required int userid,
    required int shopId,
    required double ratingValue,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'userid': '$userid',
      'shop_id': '$shopId',
      'value': '$ratingValue',
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///
  Future<Map<String, dynamic>> sellerRating({
    required int userid,
    required int sellerId,
    required double ratingValue,
    required String endPoint,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'userid': '$userid',
      'sellerid': '$sellerId',
      'value': '$ratingValue',
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  ///
  Future<Map<String, dynamic>> verifyCode({
    required String userVerifyCode,
    required String endPoint,
    required String userEmail,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'verifycode': userVerifyCode,
      'email': userEmail,
    });

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // قراءة البيانات من الاستجابة وتحويلها إلى Map
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse;
      } else {
        // إذا كانت هناك مشكلة في الطلب، يتم طباعة سبب الخطأ
        print('Request failed with status: ${response.statusCode}');
        return {'error': response.reasonPhrase};
      }
    } catch (e) {
      // التعامل مع الأخطاء المحتملة خلال الطلب
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request'};
    }
  }

  Future<Map<String, dynamic>> login({
    required String emailOrPhone,
    required String endPoint,
    required String password,
  }) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
    request.fields.addAll({
      'emailOrphone': emailOrPhone,
      'password': password,
    });

    try {
      http.StreamedResponse response = await request.send();
      var responseData = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(responseData);
        return decodedData;
      } else {
        print('Error during HTTP request: ${response.reasonPhrase}');
        return {'error': 'Error during HTTP request: ${response.reasonPhrase}'};
      }
    } catch (e) {
      print('Error during HTTP request: $e');
      return {'error': 'Error during HTTP request: $e'};
    }
  }

  Future<Map<String, dynamic>> getMaxRating({
    required int parentId,
    required String parameter,
    required String endPoint,
  }) async {
    // إنشاء كائن Dio لإرسال الطلبات
    Dio dio = Dio();

    try {
      // إرسال الطلب واستقبال الاستجابة
      Response response = await dio.post(
        '$_baseUrl$endPoint',
        data: {parameter: parentId},
      );

      // تحويل الاستجابة إلى Map
      Map<String, dynamic> responseData = response.data;

      // إعادة البيانات المستلمة
      return responseData;
    } catch (e) {
      // يمكنك التعامل مع الأخطاء هنا، مثلاً إرجاع خطأ أو تسجيله
      print('Error occurred: $e');
      return {'error': 'An error occurred while fetching data.'};
    }
  }



  /// view add Hiraj Seller

  Future<Map<String, dynamic>> addHirajSeller({
    required String endPoint,
    required String sellerName,
    required String locationSeller,
    required String addressSeller,
    required String phoneSeller,
    required String endSeller,
    required String passwordSelle,
    required int parentId,
    required File logoSeller,
    required int status,
    required int hirajId,
    required String parameterSellerName,
    required String parameterHirajId,
    required String parameterLocationSeller,
    required String parameterPhoneSeller,
    required String parameterEndSeller,
    required String parameterPasswordSelle,
    required String parameterLogoSeller,
    required String parameterSellerStatus,
    required String parameterAddressSeller,
    required String parameterParentId,
  }) async {
    try {
      var request =
      http.MultipartRequest('POST', Uri.parse('$_baseUrl$endPoint'));
      request.fields.addAll({
        parameterSellerName: sellerName,
        parameterLocationSeller: locationSeller,
        parameterPhoneSeller: phoneSeller,
        parameterPasswordSelle: passwordSelle,
        parameterEndSeller: endSeller,
        parameterSellerStatus: '$status',
        parameterHirajId: '$hirajId',
        parameterAddressSeller: addressSeller,
        parameterParentId:'$parentId'

      });
      request.files.add(await http.MultipartFile.fromPath(
          parameterLogoSeller, logoSeller.path));

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




  Future<Map<String, dynamic>> analysisSeller({
    required String endPoint,
    required int idSeller,
  }) async {
    try {

      var data = FormData.fromMap({
        'id_seller': idSeller.toString(),
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
