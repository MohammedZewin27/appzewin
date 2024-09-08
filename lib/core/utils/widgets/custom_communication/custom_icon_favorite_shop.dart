import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

import '../../../../Features/home/presentation/cubit/home_cubit.dart';
import '../../cash_data.dart';
import '../../const/constant_manager.dart';
import '../../function/call_me.dart';
import '../../responsive size/responsive_size.dart';
import '../my_box_container.dart';

class CustomIconFavoriteShop extends StatefulWidget {
  const CustomIconFavoriteShop({
    super.key,
    required this.shopId,
    required this.isFavorite,
  });


  final int shopId;

  final bool isFavorite;

  @override
  State<CustomIconFavoriteShop> createState() =>
      _CustomIconFavoriteShopState();
}

class _CustomIconFavoriteShopState extends State<CustomIconFavoriteShop> {
  @override
  Widget build(BuildContext context) {
    // bool activeFavorite;
    //
    // if(sellerFavoriteIsSelected==1){
    //   activeFavorite=true;
    // }else{
    //   activeFavorite=false;
    // }

    return MyBoxContainer(
      child: IconButton(
        onPressed: () {
          setState(() {
            if( CacheData.getData(key: StringCache.userId) != 0
                ){
              if(isFavoriteShop[widget.shopId]==0){
                // sellerFavoriteIsSelected=1;
                // activeFavorite !=activeFavorite;

                FavoriteIsSelected.setFavoriteShop(idProduct: widget.shopId, value: 1);
                HomeCubit.get(context).favoriteShop(shopId: widget.shopId);
                CherryToast.success(
                    title: const Text("المفضلة", style: TextStyle(color: Colors.black)),
                    action: const Text("تم الاضافة الى المفضلة",
                        style: TextStyle(color: Colors.black)),
                    actionHandler:(){
                      print(isFavoriteShop);
                      // HomeCubit.get(context).favoriteShop(shopId: widget.shopId);
                    }
                ).show(context);

              }else {
                // sellerFavoriteIsSelected=0;
                // activeFavorite !=activeFavorite;
                FavoriteIsSelected.setFavoriteShop(idProduct: widget.shopId, value: 0);
                HomeCubit.get(context).favoriteShop(shopId: widget.shopId);
                CherryToast.error(
                    title: const Text("المفضلة", style: TextStyle(color: Colors.black)),
                    action: const Text('تم الازاله من المفضلة',
                        style: TextStyle(color: Colors.black)),
                    actionHandler:(){
                      print(isFavoriteShop);


                    }
                ).show(context);

              }
            }else{
              registerNow(context);



            }


          });
        },
        icon: Center(
          child: Icon(
            Icons.favorite,
            size: getResponsiveSize(context, size: 20),
            color: isFavoriteShop[widget.shopId]==1 ? Colors.redAccent : Colors.grey,
          ),
        ),
      ),
    );
  }
}