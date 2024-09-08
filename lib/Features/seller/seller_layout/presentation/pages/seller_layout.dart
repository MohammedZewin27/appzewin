import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/analysis/api_analysis/api_analysis.dart';
import 'package:sahel_net/Features/seller/core/api/api_service_seller.dart';
import 'package:sahel_net/Features/seller/seller_analysis/data/repositories/analysis_seller_repo_impl.dart';
import 'package:sahel_net/Features/seller/seller_analysis/presentation/cubit/social_media_seller_cubit.dart';
import 'package:sahel_net/Features/seller/seller_setting/data/repositories/setting_seller_repo_impl.dart';

import 'package:sahel_net/core/utils/api/api_service.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../choose_user/presentation/cubit/seller_full_active_cubit.dart';
import '../../../add_post/presentation/pages/AddPost.dart';
import '../../../core/const.dart';
import '../../../seller_post/presentation/cubit/analysis_cubit.dart';
import '../../../seller_setting/presentation/cubit/setting_seller_cubit.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';
import '../../../sing_up_seller/data/repositories/seller_repo_impl.dart';
import '../cubit/layout_cubit.dart';
import '../widgets/bottom_nav_bar.dart';

class SellerLayout extends StatelessWidget {
  const SellerLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => LayoutCubitSeller(),
      ),
      BlocProvider(
        create: (context) =>
            SettingSellerCubit(SettingSellerRepoImpl(ApiServiceSeller(Dio()))),
      ),
    ], child: const SellerHomeBody());
  }
}

class SellerHomeBody extends StatelessWidget {
  const SellerHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubitSeller, LayoutSellerState>(
      builder: (context, state) {
        List<Widget> pages = getSellerPages();
        var cubit = LayoutCubitSeller.get(context);
        return Scaffold(
            key: cubit.scaffoldState,
            appBar: AppBar(
              title: Text(titleList[cubit.newIndex]),
              elevation: 10,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    images[cubit.newIndex],
                  ),
                )
              ],
            ),
            // drawer: const Drawer(),
            resizeToAvoidBottomInset: false,
            extendBody: true,
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorManager.lightGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddSellerPost(),
                    ));
              },
              child: const Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: 25,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavBarSeller(
              onTap: (index) {
                cubit.changeIndex(index);
              },
              indexPage: cubit.newIndex,
              itemCount: pages.length,
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  ColorManager.primary7,
                  ColorManager.white,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: ScreensSeller(
                index: cubit.newIndex,
              ),
            ));
      },
    );
  }
}

class ScreensSeller extends StatelessWidget {
  const ScreensSeller({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SellerFullActiveCubit(SellerRepoImpl(ApiService(Dio())))
                ..getSellerData(),
        ),
        BlocProvider(
          create: (context) => AnalysisCubit(),
        ),
        BlocProvider(
          create: (context) => SocialMediaSellerCubit(AnalysisSellerRepoImpl(ApiAnalysis(Dio()))),
        ),
        // BlocProvider(
        //   create: (context) => SocialMediaProductCubit(PostSellerRepoImpl(ApiServiceSeller(Dio()))),
        // ),

      ],
      child: BlocBuilder<SellerFullActiveCubit, SellerFullActiveState>(
        builder: (context, state) {
          if (state is SellerFullActiveSuccess) {
            SellerData? dataSeller = state.sellerData.sellerData;
            dataSellerInScreenAddPost = dataSeller;
            List<Widget> pages = getSellerPages(sellerData: dataSeller);
            return pages[index];
          } else {
            return const Center(child: CustomProgressIndicator());
          }
        },
      ),
    );
  }
}
