import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/setting/presentation/cubit/setting_cubit.dart';

import 'package:sahel_net/core/variable.dart';
import '../../../../core/utils/widgets/custom_refresh_indicator_page.dart';
import '../../../../core/utils/widgets/failure_connect.dart';

import '../../../drawer/presentation/pages/drawer_view.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../../data/models/home_model.dart';
import '../cubit/home_cubit.dart';
import '../widgets/custom_dialog_advertisement/custom_dialog_advertisement.dart';
import '../widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    scaffoldKey = GlobalKey<ScaffoldState>();
    dialogAdvertisement();
    super.initState();
  }

  Future dialogAdvertisement() {
    return Future.delayed(
      const Duration(seconds: 15),
      () {
        dataDialogAdvertisement.isNotEmpty
            ? showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) =>
                    const CustomDialogAdvertisement())
            : const SizedBox.shrink();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit.get(context)
        .fetchHome(idParent: ParentCubit.get(context).parentId);
    // SettingCubit.get(context).fetchUserData();
    return RefreshIndicator(
      onRefresh: () {
        SettingCubit.get(context).fetchUserData();
        return HomeCubit.get(context)
            .fetchHome(idParent: ParentCubit.get(context).parentId);
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is AllCategorySuccess) {
            var categories = state.homeModel.parent?.data?[0].categories;
            var last10Shop = state.homeModel.parent?.lastShops?.shopsData ?? [];
            var lastProducts =
                state.homeModel.parent?.lastProducts?.lastProductsData ?? [];
            var shopRating = state.homeModel.parent?.shopsRating;
            Advertisement? advertisement =
                state.homeModel.parent?.advertisement!;
            return Scaffold(
              key: scaffoldKey,
              drawer: const CustomDrawer(),
              body: HomeViewBody(
                categories: categories!,
                lastShops: last10Shop,
                lastProducts: lastProducts,
                advertisement: advertisement!,
                shopsRating: shopRating,
              ),
            );
          } else if (state is AllCategoryFailure) {
            return FailureConnect(
              onPressed: () {
                SettingCubit.get(context).fetchUserData();

                HomeCubit.get(context)
                    .fetchHome(idParent: ParentCubit.get(context).parentId);
              },
            );
          }
          return CustomRefreshIndicatorPage(
            onRefresh: () {
              SettingCubit.get(context).fetchUserData();
              // HomeCubit.get(context).isSettingAdvertisementActive=false;
              return HomeCubit.get(context)
                  .fetchHome(idParent: ParentCubit.get(context).parentId);
            },
          );
        },
      ),
    );
  }
}
