import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

import 'package:sahel_net/Features/hiraj/presentation/cubit/hiraj_cubit.dart';

import '../../cash_data.dart';
import '../../const/constant_manager.dart';
import '../../function/call_me.dart';
import '../../responsive size/responsive_size.dart';
import '../my_box_container.dart';

class CustomIconFavoriteSeller extends StatefulWidget {
  const CustomIconFavoriteSeller({
    super.key,
    required this.sellerId,

  });

  final int sellerId;



  @override
  State<CustomIconFavoriteSeller> createState() =>
      _CustomIconFavoriteSellerState();
}

class _CustomIconFavoriteSellerState extends State<CustomIconFavoriteSeller> {
  @override
  Widget build(BuildContext context) {


    return MyBoxContainer(
      child: IconButton(
        onPressed: () {
          setState(() {
            print(isFavoriteSeller);
            if(CacheData.getData(key: StringCache.userId) != 0){
              if(isFavoriteSeller[widget.sellerId]==0){
                HirajCubit.get(context).favoriteSeller(sellerId: widget.sellerId);
                FavoriteIsSelected.setFavoriteSeller(idSeller: widget.sellerId, value: 1);

                CherryToast.success(
                    title: const Text("المفضلة", style: TextStyle(color: Colors.black)),
                    action: const Text("تم الاضافة الى المفضلة",
                        style: TextStyle(color: Colors.black)),
                    actionHandler:(){

                      HirajCubit.get(context).favoriteSeller(sellerId: widget.sellerId);
                    }
                ).show(context);

              }else {
                HirajCubit.get(context).favoriteSeller(sellerId: widget.sellerId);
                FavoriteIsSelected.setFavoriteSeller(idSeller:  widget.sellerId, value: 0);


                CherryToast.error(
                    title: const Text("المفضلة", style: TextStyle(color: Colors.black)),
                    action: const Text('تم الازاله من المفضلة',
                        style: TextStyle(color: Colors.black)),
                    actionHandler:(){

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
            color: isFavoriteSeller[widget.sellerId]==1 ? Colors.redAccent : Colors.grey,
          ),
        ),
      ),
    );
  }
}

