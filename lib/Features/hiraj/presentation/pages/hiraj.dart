import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/hiraj/presentation/cubit/hiraj_cubit.dart';
import 'package:sahel_net/core/utils/widgets/failure_connect.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/widgets/custom_refresh_indicator_page.dart';
import '../../../drawer/presentation/pages/drawer_view.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../../../setting/presentation/cubit/setting_cubit.dart';
import '../../data/models/hiraj_model.dart';
import '../widgets/hiraj_body.dart';

class Hiraj extends StatefulWidget {
  const Hiraj({
    super.key,
  });

  @override
  State<Hiraj> createState() => _HirajState();
}

class _HirajState extends State<Hiraj> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    HirajCubit.get(context)
        .fetchHiraj(idParent: ParentCubit.get(context).parentId);
    return BlocBuilder<HirajCubit, HirajState>(
      builder: (context, state) {
        if (state is HirajSuccess) {
          var productData = state.hirajModel.products?.productData ?? [];
          var hirajData = state.hirajModel.hiraj?.hirajData ?? [];
          var sellerData = state.hirajModel.hirajSeller?.hirajSellerData ?? [];
          var productsRating = state.hirajModel.productsRating;
          return hirajData.isNotEmpty && sellerData.isNotEmpty
              ? Scaffold(
                  key: scaffoldKey,
                  backgroundColor: Colors.transparent,
                  drawer: const CustomDrawer(),
                  body: HirajBody(
                    hirajData: hirajData,
                    sellerData: sellerData,
                    productData: productData,
                    productsRating: productsRating!,
                  ),
                )
              : FailureConnect(
                  onPressed: () {
                    SettingCubit.get(context).fetchUserData();

                    HirajCubit.get(context).fetchHiraj(
                        idParent: ParentCubit.get(context).parentId);
                  },
                );
        } else if (state is HirajFailure) {
          return FailureConnect(
            onPressed: () {
              SettingCubit.get(context).fetchUserData();

              HirajCubit.get(context)
                  .fetchHiraj(idParent: ParentCubit.get(context).parentId);
            },
          );
        }
        // else {
        //   return CustomRefreshIndicatorPage(onRefresh: () {
        //     return  HirajCubit.get(context).fetchHiraj(idParent:  ParentCubit.get(context).parentId);
        //   },);
        // }
        else {
          ProductsRating productsRating = ProductsRating();
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            drawer: const CustomDrawer(),
            body: Skeletonizer(
              child: HirajBody(
                hirajData: [],
                sellerData: [],
                productData: [],
                productsRating: productsRating,
              ),
            ),
          );
        }
      },
    );
  }
}
