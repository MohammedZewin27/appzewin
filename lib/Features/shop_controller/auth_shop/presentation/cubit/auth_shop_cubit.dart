import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../parent/data/models/parent_model.dart';

import '../../data/models/add_shop_database.dart';
import '../../data/repositories/auth_shop_repo.dart';

part 'auth_shop_state.dart';

class AuthShopCubit extends Cubit<AuthShopState> {
  AuthShopCubit(this.authShopRepo) : super(AuthShopInitial());
  final AuthShopRepo authShopRepo;

  static AuthShopCubit get(context) => BlocProvider.of(context);

  int? parentId;
  int? categoryId;
  int? subCategoryShop;
  File? logeImageFile;
  TextEditingController nameShopController = TextEditingController();
  TextEditingController phoneShopController = TextEditingController();
  TextEditingController addressShopController = TextEditingController();
  TextEditingController passwordAddShopController = TextEditingController();
  TextEditingController locationAddShopController = TextEditingController();
  DateTime endDateTime = DateTime.now();
  late DateTime endAddOneYearDateTime;

  void calculateNewDate() {
    endAddOneYearDateTime = DateTime(
      endDateTime.year ,
      endDateTime.month+ 6,
      endDateTime.day,
      endDateTime.hour,
      endDateTime.minute,
      endDateTime.second,
      endDateTime.millisecond,
      endDateTime.microsecond,
    );
  }

void clearController(){
  policyShopChecked=false;
 logeImageFile=null;
nameShopController.clear() ;
   phoneShopController.clear() ;
   addressShopController.clear();
   passwordAddShopController.clear();
  codeController.clear();
  passwordController.clear();

}
  // int? categoryShop;

  // int? idParent;
  // int? idShop = CacheData.getData(key: StringCache.idShop);

  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// add shop
  Future<void> addShopInDatabase() async {
    emit(AddShopLoading());
    var result = await authShopRepo.addShop(
      shopLocation: locationAddShopController.text,
        shopName: nameShopController.text,
        shopPhone: phoneShopController.text,
        shopAddress: addressShopController.text,
        shopInformation: '',
        shopTimeEnd: endAddOneYearDateTime.toString(),
        shopStatus: 0,

        passwordShop: passwordAddShopController.text,
        subCategoriesId: subCategoryShop.toString(),
        parentId: parentId,
        imageProduct: logeImageFile!);

    result.fold(
      (failure) {
        emit(AuthShopFailure(failure.errorMessage));
      },
      (shopDataModel) {
        emit(AddShopSuccess(shopDataModel: shopDataModel));
      },
    );
  }

  /// parent
  Future<void> fetchParent() async {
    emit(ShopParentLoading());
    var result = await authShopRepo.fetchParent();

    result.fold(
      (failure) {
        emit(ShopParentFailure(failure.errorMessage));
      },
      (parentModel) {
        emit(ShopParentSuccess(parentModel: parentModel));
      },
    );
  }

  Future<void> fetchShopUser() async {
    emit(AuthShopLoading());
    var result = await authShopRepo.getShopWithCodAndPassword(
        shopCode: codeController.text, shopPassword: passwordController.text);

    result.fold(
      (failure) {
        emit(AuthShopFailure(failure.errorMessage));
      },
      (shopModel) {
        emit(AuthShopSuccess(shopsModel: shopModel));
      },
    );
  }


  bool policyShopChecked = false;
}
