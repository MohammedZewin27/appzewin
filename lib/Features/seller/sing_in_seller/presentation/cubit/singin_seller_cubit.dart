import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../sing_up_seller/data/models/seller_model.dart';
import '../../data/repositories/sing_in_seller_repo.dart';

part 'singin_seller_state.dart';

class SingInSellerCubit extends Cubit<SingInSellerState> {
  SingInSellerCubit(this.authSellerRepo) : super(SingInSellerInitial());
  final AuthSellerRepo authSellerRepo;

  static SingInSellerCubit get(context) => BlocProvider.of(context);


  TextEditingController code=TextEditingController();
  TextEditingController password=TextEditingController();
// String newCode='';
  Future<void> getSellerWithCode(
      ) async {
    emit(SingInSellerLoading());
    var result =
    await authSellerRepo.getSellerWithCodAndPassword(codeSeller: code.text, passwordSelle: password.text);

    result.fold(
          (failure) {
        emit(SingInSellerFailure(failure.errorMessage));
      },
          (sellerModel) {

        emit(SingInSellerSuccess(sellerModel: sellerModel),);

      },
    );
  }
  bool policyChecked = false;
}
