import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:sahel_net/Features/seller/sing_up_seller/data/repositories/seller_repo.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/utils/api/api_service.dart';
import '../../../../parent/data/models/parent_model.dart';
import '../models/seller_model.dart';

class SellerRepoImpl implements SellerRepo {
  final ApiService apiService;

  SellerRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ParentModel>> fetchParent() async {
    try {
      var data = await apiService.get(
        endPoint: 'appView/view_parent.php',
      );

      ParentModel parentModel = ParentModel.fromJson(data);
      print("=============================$data");
      return right(parentModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SellerCategoryModel>> fetchCategory(
      {int? parentId}) async {
    try {
      var data = await apiService.getCategory(
        parentId: parentId,
        endPoint: 'hiraj/hiraj_categories/view_hiraj.php',
      );

      SellerCategoryModel sellerCategoryModel =
          SellerCategoryModel.fromJson(data);
      print("=============================$data");
      return right(sellerCategoryModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SellerModel>> addSellerHiraj({
    required String sellerName,
    required String locationSeller,
    required String phoneSeller,
    required String endSeller,
    required String passwordSelle,
    required String addressSeller,
    required File logoSeller,
    required int status,
    required int hirajId,
    required int parentId,
  }) async {
    try {
      var data = await apiService.addHirajSeller(
          parentId: parentId,
          addressSeller: addressSeller,
          passwordSelle: passwordSelle,
          phoneSeller: phoneSeller,
          sellerName: sellerName,
          hirajId: hirajId,
          status: status,
          endSeller: endSeller,
          locationSeller: locationSeller,
          logoSeller: logoSeller,
          parameterParentId: 'parent_id',
          parameterEndSeller: 'end_seller',
          parameterLocationSeller: 'location_seller',
          parameterLogoSeller: 'image_hiraj_seller',
          parameterPasswordSelle: 'password_hiraj_selle',
          parameterPhoneSeller: 'phone_seller',
          parameterSellerName: 'name_seller',
          parameterSellerStatus: 'seller_status',
          parameterHirajId: 'hiraj_id',
          parameterAddressSeller: 'address_seller',
          endPoint: 'hiraj/hiraj_seller/add_hiraj_seller.php');
      SellerModel sellerData = SellerModel.fromJson(data);

      return right(sellerData);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, SellerModelHome>> fetchSellerWithId({int? idSeller}) async {
    try {
      var data = await apiService.getSeller(
          endPoint: 'appView/seller/sellerView.php', idSeller: idSeller);
      SellerModelHome sellerModel = SellerModelHome.fromJson(data);
      return right(sellerModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
