import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../sing_up_seller/data/models/seller_model.dart';
import '../../data/models/producte_model.dart';
import '../../data/repos/add_post_repo.dart';

part 'add_post_seller_state.dart';

class AddPostSellerCubit extends Cubit<AddPostSellerState> {
  AddPostSellerCubit(this.addProductRepo) : super(AddPostSellerInitial());

  static AddPostSellerCubit get(context) => BlocProvider.of(context);
  final AddProductRepo addProductRepo;
  late SellerData? dataSeller;




  File? imagePoster;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController deliveryServiceController = TextEditingController();
  TextEditingController detailsProductController = TextEditingController();
  TextEditingController newPriceProductController = TextEditingController();
  TextEditingController oldPriceProductController = TextEditingController();
  TextEditingController qualityProductController = TextEditingController();
  DateTime endDateTime = DateTime.now();
  String statusProduct = '0';
  String deliveryService = '0';

  void checkStatusProduct(bool activeStatus) {
    if (activeStatus) {
      statusProduct = '1';
    } else {
      statusProduct = '0';
    }
  }

  List<File> addMoreImages = [];
  XFile? xFileMoreImages;

  void checkDeliveryService(bool activeDelivery) {
    if (activeDelivery) {
      deliveryService = '1';
    } else {
      deliveryService = '0';
    }
  }

  ///
  Future<void> addProduct({required int idParent, required sellerId}) async {
    emit(AddPostSellerLoading());

    var result = await addProductRepo.addProduct(
        parentId: idParent,
        sellerId: sellerId!,
        titleProduct: nameController.text,
        detailsProduct: detailsProductController.text,
        newPriceProduct: newPriceProductController.text,
        oldPriceProduct: oldPriceProductController.text,
        qualityProduct: '1',
        deliveryService: deliveryService,
        statusProduct: statusProduct,
        endProduct: endDateTime.toString(),
        ratingProduct: '1.0000',
        image: imagePoster!);

    result.fold((l) {
      emit(AddPostSellerFailure());
    }, (productsModel) {
      Future.wait(addMoreImages.map((image) {
        return addProductRepo.addImagesPostSeller(
            productId: productsModel.message?.idProduct ?? 0,
            newImageProduct: image);
      })).then((_) {
        Future.delayed(const Duration(seconds: 2), () {
          emit(AddPostSellerSuccess(productsModel: productsModel));
        });
      },);


    });
  }
// Future.wait(moreImages.map((image){
//   return cubit.addImagesToProduct(
//       productId: productId, newImageProduct: moreImages[i]);
// }) );
}
