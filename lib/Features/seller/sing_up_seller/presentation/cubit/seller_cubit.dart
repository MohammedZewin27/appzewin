import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sahel_net/core/utils/cash_data.dart';

import '../../../../parent/data/models/parent_model.dart';
import '../../data/models/seller_model.dart';
import '../../data/repositories/seller_repo.dart';

part 'seller_state.dart';

class SellerCubit extends Cubit<SellerState> {
  SellerCubit(this.sellerRepo) : super(SellerInitial());

  static SellerCubit get(context) => BlocProvider.of(context);

  final SellerRepo sellerRepo;

  Future<void> fetchParent() async {
    emit(SellerLoading());
    var result = await sellerRepo.fetchParent();

    result.fold(
      (failure) {
        emit(SellerFailure(failure.errorMessage));
      },
      (parentModel) {
        emit(SellerSuccess(parentModel: parentModel));
      },
    );
  }

  int? parentId;
  File? logeImageFile;
  TextEditingController nameSellerController = TextEditingController();
  TextEditingController phoneSellerController = TextEditingController();
  TextEditingController addressSellerController = TextEditingController();
  TextEditingController passwordSellerController = TextEditingController();
  TextEditingController locationSellerController = TextEditingController();
  DateTime endDateTime = DateTime.now();
 late DateTime endAddOneYearDateTime;
  void calculateNewDate() {
    endAddOneYearDateTime = DateTime(
      endDateTime.year + 1,
      endDateTime.month,
      endDateTime.day,
      endDateTime.hour,
      endDateTime.minute,
      endDateTime.second,
      endDateTime.millisecond,
      endDateTime.microsecond,
    );
  }
  int? hirajId;
  int? idParent;
  int? idSeller=CacheData.getData(key: StringCache.idSeller);

  Future<void> addNewSeller() async {
    emit(AddSellerLoading());
    var result = await sellerRepo.addSellerHiraj(
      parentId: idParent!,
      addressSeller: addressSellerController.text,
      sellerName: nameSellerController.text,
      phoneSeller: phoneSellerController.text,
      passwordSelle: passwordSellerController.text,
      logoSeller: logeImageFile!,
      locationSeller: locationSellerController.text,
      endSeller: endAddOneYearDateTime.toString(),
      status: 0,
      hirajId: hirajId!,
    );
    result.fold(
      (failure) {
        AddSellerFailure(failure.errorMessage);
      },
      (sellerData) {
        emit(AddSellerSuccess(sellerData: sellerData));

      },
    );
  }
  bool policyChecked = false;
}
