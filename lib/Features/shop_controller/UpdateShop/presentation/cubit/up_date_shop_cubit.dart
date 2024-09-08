import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/cash_data.dart';
import '../../../auth_shop/data/models/add_shop_database.dart';
import '../../../information_shop_user/data/models/information_model.dart';
import '../../data/repositories/update_shop_repo.dart';

part 'up_date_shop_state.dart';

class UpDateShopCubit extends Cubit<UpDateShopState> {
  UpDateShopCubit(this.settingShopRepo) : super(UpDateShopInitial());
  final UpdateShopRepo settingShopRepo;

  static UpDateShopCubit get(context) => BlocProvider.of(context);
  List<File> addMoreImages = [];
  XFile? xFileMoreImages;
  XFile? xFile;
  File? newImageProduct;
  List<String> addServices=[];
  TextEditingController servicesController=TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> updateShopUser({
    required String shopPhone,
    required String shopAddress,
    required String shopInformation,
    required String oldShopImage,
  }) async {
    emit(UpdateShopLoading());
    var result = await settingShopRepo.updateShop(
        oldShopImage: oldShopImage,
        newImageShop: newImageProduct,

        ///---------
        shopAddress: shopAddress,
        shopInformation: shopInformation,
        shopPhone: shopPhone,
        shopId: CacheData.getData(key: StringCache.idShop) ?? 0);

    result.fold(
      (failure) {
        emit(UpdateShopFailure(failure.errorMessage));
      },
      (updateShop) {
        emit(UpdateShopSuccess(updateShop: updateShop));
      },
    );
  }

  Future<void> addImageShop({File? shopImage}) async {
    final shopId = CacheData.getData(key: StringCache.idShop) ?? 0;
    await settingShopRepo.addPhotoShop(
      shopId: shopId,
      shopImage: shopImage,
    );
  }

  Future<void> addServicesShop({
    required String shopServices,

  }) async {
    final shopId = CacheData.getData(key: StringCache.idShop) ?? 0;
    await settingShopRepo.addServicesShop(
      shopId: shopId,
      shopServices: shopServices,
    );
  }

  Future<void> deleteImageShop({
    required int imageId,
    required String imageShop,
  }) async {
    await settingShopRepo.deletePhotoShop(
      imageShop: imageShop,
      imageId: imageId,
    );
  }

  Future<void> deleteServicesShop({
    required int servicesId,

  }) async {
    await settingShopRepo.deleteServicesShop(
      servicesId:servicesId ,


    );
  }
}
