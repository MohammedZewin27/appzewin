import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/cubit/home_cubit.dart';

import '../../../../Features/hiraj/presentation/cubit/hiraj_cubit.dart';
import '../../cash_data.dart';
import '../../const/constant_manager.dart';
import '../../function/call_me.dart';
import '../../responsive size/responsive_size.dart';
import '../my_box_container.dart';

class CustomIconFavoriteProducts extends StatefulWidget {
  const CustomIconFavoriteProducts({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<CustomIconFavoriteProducts> createState() =>
      _CustomIconFavoriteProductsState();
}

class _CustomIconFavoriteProductsState
    extends State<CustomIconFavoriteProducts> {
  @override
  Widget build(BuildContext context) {
    return MyBoxContainer(
      child: IconButton(
        onPressed: () {
          setState(() {
            if (CacheData.getData(key: StringCache.userId) != 0) {
              if (isFavoriteProduct[widget.productId] == 0) {
                print(isFavoriteProduct);
                FavoriteIsSelected.setFavoriteProduct(widget.productId, 1);
                HirajCubit.get(context)
                    .favoriteProducts(productId: widget.productId);
                isFavoriteProduct[widget.productId] =
                    1; // تحديث قيمة المتغير هنا
                // print('//////////55//////////');
                // print(isFavoriteProduct);
                // print('///////////55/////////');

                CherryToast.success(
                        title: const Text("المفضلة",
                            style: TextStyle(color: Colors.black)),
                        action: const Text("تم الاضافة الى المفضلة",
                            style: TextStyle(color: Colors.black)),
                        actionHandler: () {})
                    .show(context);
              } else {
                FavoriteIsSelected.setFavoriteProduct(widget.productId, 0);
                HirajCubit.get(context)
                    .favoriteProducts(productId: widget.productId);
                isFavoriteProduct[widget.productId] = 0; // وهنا أيضًا
                // print('////////////////////');
                // print(isFavoriteProduct);
                // print('////////////////////');

                CherryToast.error(
                        title: const Text("المفضلة",
                            style: TextStyle(color: Colors.black)),
                        action: const Text('تم الازاله من المفضلة',
                            style: TextStyle(color: Colors.black)),
                        actionHandler: () {})
                    .show(context);
              }
            } else {
              registerNow(context);
            }
          });
        },
        icon: Center(
          child: Icon(
            Icons.favorite,
            size: getResponsiveSize(context, size: 20),
            color: isFavoriteProduct[widget.productId] == 1
                ? Colors.redAccent
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
//CustomIconFavoriteProductsHome

class CustomIconFavoriteProductsHome extends StatefulWidget {
  const CustomIconFavoriteProductsHome({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<CustomIconFavoriteProductsHome> createState() =>
      _CustomIconFavoriteProductsHomeState();
}

class _CustomIconFavoriteProductsHomeState
    extends State<CustomIconFavoriteProductsHome> {
  @override
  Widget build(BuildContext context) {
    return MyBoxContainer(
      child: IconButton(
        onPressed: () {
          setState(() {
            if (CacheData.getData(key: StringCache.userId) != 0) {
              if (isFavoriteProduct[widget.productId] == 0) {
                print(isFavoriteProduct);
                FavoriteIsSelected.setFavoriteProduct(widget.productId, 1);
                HomeCubit.get(context)
                    .favoriteProductsHome(productId: widget.productId);
                isFavoriteProduct[widget.productId] =
                    1; // تحديث قيمة المتغير هنا
                // print('//////////55//////////');
                // print(isFavoriteProduct);
                // print('///////////55/////////');

                CherryToast.success(
                        title: const Text("المفضلة",
                            style: TextStyle(color: Colors.black)),
                        action: const Text("تم الاضافة الى المفضلة",
                            style: TextStyle(color: Colors.black)),
                        actionHandler: () {})
                    .show(context);
              } else {
                FavoriteIsSelected.setFavoriteProduct(widget.productId, 0);
                HomeCubit.get(context)
                    .favoriteProductsHome(productId: widget.productId);
                isFavoriteProduct[widget.productId] = 0; // وهنا أيضًا
                // print('////////////////////');
                // print(isFavoriteProduct);
                // print('////////////////////');

                CherryToast.error(
                        title: const Text("المفضلة",
                            style: TextStyle(color: Colors.black)),
                        action: const Text('تم الازاله من المفضلة',
                            style: TextStyle(color: Colors.black)),
                        actionHandler: () {})
                    .show(context);
              }
            } else {
              registerNow(context);
            }
          });
        },
        icon: Center(
          child: Icon(
            Icons.favorite,
            size: getResponsiveSize(context, size: 20),
            color: isFavoriteProduct[widget.productId] == 1
                ? Colors.redAccent
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
