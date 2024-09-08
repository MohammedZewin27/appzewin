import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/Features/seller/seller_post/data/repositories/post_seller_repo.dart';
import 'package:sahel_net/core/utils/cash_data.dart';

import '../../data/models/post_seller_model.dart';

part 'post_seller_state.dart';

class PostSellerCubit extends Cubit<PostSellerState> {
  PostSellerCubit(this.postSellerRepo) : super(PostSellerInitial());
  final PostSellerRepo postSellerRepo;

  static PostSellerCubit get(context) => BlocProvider.of(context);

  Future<void> fetchPostOfSeller({required int sellerId}) async {
    emit(PostSellerLoading());

    var result = await postSellerRepo.getPostSeller(sellerId: sellerId);
    result.fold((failure) {
      emit(PostSellerFailure(failure.errorMessage));
    }, (postSellerModel) {
      emit(PostSellerSuccess(postSellerModel: postSellerModel));
    });
  }

  File? newImageProduct;
  late String statusProduct;
  late String deliveryService;
  XFile? xFile;

  void checkStatusProduct(bool activeStatus) {
    if (activeStatus) {
      statusProduct = '1';
    } else {
      statusProduct = '0';
    }
  }

  XFile? xFileMoreImages;
  List<File> moreImages = [];

  void checkDeliveryService(bool activeDelivery) {
    if (activeDelivery) {
      deliveryService = '1';
    } else {
      deliveryService = '0';
    }
  }

  Future<void> updatePostOfSeller({
    required int idProduct,
    required String titleProduct,
    required String detailsProduct,
    required String newPriceProduct,
    required String oldPriceProduct,
    required String qualityProduct,
    required String oldImage,
    // required File imageProduct,
  }) async {
    // emit(UpdateSellerLoading());

    // var result =
    await postSellerRepo.updatePostSeller(
        newImageProduct: newImageProduct,
        titleProduct: titleProduct,
        detailsProduct: detailsProduct,
        newPriceProduct: newPriceProduct,
        oldPriceProduct: oldPriceProduct,
        qualityProduct: qualityProduct,
        deliveryService: deliveryService,
        statusProduct: statusProduct,
        oldImage: oldImage,
        idSellerProduct: idProduct);
    // result.fold((failure) {
    //   emit(UpdateSellerFailure(failure.errorMessage));
    //   fetchPostOfSeller(sellerId: CacheData.getData(key: StringCache.idSeller));
    // }, (updateProduct) {
    //   emit(UpdateSellerSuccess(updateProduct: updateProduct));
    //   fetchPostOfSeller(sellerId: CacheData.getData(key: StringCache.idSeller));
    // });
  }

  Future<void> addImagesToProduct(
      {required int productId, File? newImageProduct}) async {
    emit(AddImagesToProductLoading());

    await postSellerRepo.addImagesPostSeller(
      productId: productId,
      newImageProduct: newImageProduct,
    );

  }

  Future<void> deleteImage(
      {required int imageId, required String imageName}) async {
    // emit(DeleteImageFromMoreImageLoading());

    // var result =
    await postSellerRepo.deleteFromMoreImages(
      imageId: imageId.toString(),
      imageName:imageName ,

    );
    // result.fold((failure) {
    //   emit(DeleteImageFromMoreImageFailure(failure.errorMessage));
    //   // fetchPostOfSeller(sellerId: CacheData.getData(key: StringCache.idSeller));
    // }, (imagesAddModel) {
    //   emit(DeleteImageFromMoreImageSuccess());
    //   fetchPostOfSeller(sellerId: CacheData.getData(key: StringCache.idSeller));
    // });
  }
  Future<void> deleteProductSeller(
      {required int productId, required String imageName,required List<ProductImagesData>images}) async {
    Future.wait(images.map((image) {
      int? imageId=image.productId;
      String? imageName=image.productImage;
      return postSellerRepo.deleteFromMoreImages(
          imageId: imageId.toString(),
      imageName:imageName??'' ,);
    })).then((value) {
       postSellerRepo.deleteProduct(
        productId: productId.toString(),
        imageName:imageName ,

      ).then((value) {
         fetchPostOfSeller(sellerId: CacheData.getData(key: StringCache.idSeller) );
      },);

    },);

    // result.fold((failure) {
    //   emit(DeleteImageFromMoreImageFailure(failure.errorMessage));
    //   // fetchPostOfSeller(sellerId: CacheData.getData(key: StringCache.idSeller));
    // }, (imagesAddModel) {
    //   emit(DeleteImageFromMoreImageSuccess());
    //   fetchPostOfSeller(sellerId: CacheData.getData(key: StringCache.idSeller));
    // });
  }
}
