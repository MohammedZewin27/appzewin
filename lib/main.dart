import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahel_net/Features/analysis/data/repositories/analysis_repo_impl.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/cubit/auth_shop_cubit.dart';
import 'package:sahel_net/Features/shop_controller/core_shop/api/api_shop.dart';

import 'Features/Layout/data/repos/layout_repo_impl.dart';
import 'Features/Layout/presentation/cubit/layout_cubit.dart';
import 'Features/analysis/api_analysis/api_analysis.dart';
import 'Features/analysis/presentation/cubit/app_analysis_cubit.dart';
import 'Features/auth/data/repositories/auth_repo_impl.dart';
import 'Features/auth/presentation/cubit/auth_cubit.dart';

import 'Features/drawer/presentation/cubit/drawer_cubit.dart';
import 'Features/favorite/data/repo/favorite_repo_impl.dart';
import 'Features/favorite/presentation/cubit/favorite_view_cubit.dart';
import 'Features/hiraj/data/repositories/hiraj_repo_impl.dart';
import 'Features/hiraj/presentation/cubit/hiraj_cubit.dart';
import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/presentation/cubit/home_cubit.dart';
import 'Features/parent/data/repos/parent_repo_impl.dart';
import 'Features/parent/presentation/cubit/parent_cubit.dart';
import 'Features/search/data/repos/search_repo_impl.dart';
import 'Features/search/preasention/view_model/search_cubit.dart';
import 'Features/seller/core/api/api_service_seller.dart';
import 'Features/seller/seller_post/data/repositories/post_seller_repo_impl.dart';
import 'Features/seller/seller_post/presentation/cubit/post_seller_cubit.dart';
import 'Features/seller/sing_in_seller/data/repositories/sing_in_seller_repo_impl.dart';
import 'Features/seller/sing_in_seller/presentation/cubit/singin_seller_cubit.dart';
import 'Features/setting/data/repos/setting_repo_impl.dart';
import 'Features/setting/presentation/cubit/cubit_send_massage/send_massage_cubit.dart';
import 'Features/setting/presentation/cubit/setting_cubit.dart';
import 'Features/shop_controller/auth_shop/data/repositories/auth_shop_repo_impl.dart';
import 'core/permission_service.dart';
import 'core/utils/api/api_service.dart';
import 'core/utils/cash_data.dart';
import 'core/utils/routes/routes_manager.dart';
import 'core/utils/theme/theme_manager.dart';
import 'core/utils/widgets/my_block_observer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CacheData.cacheInitialization();
  // setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(

      //   DevicePreview(
      // builder: (context) {
      //   return
      const DigitalArtawiya()
      // ;
      // })
      );
}

class DigitalArtawiya extends StatelessWidget {
  const DigitalArtawiya({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(HomeRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                AppAnalysisCubit(AnalysisRepoImpl(ApiAnalysis(Dio()))),
          ),
          BlocProvider(
            create: (context) => TabCubit(),
          ),
          BlocProvider(
            create: (context) => HirajCubit(HirajRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) => LayoutCubit(LayoutRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) => AuthCubit(AuthRepoRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                ParentCubit(ParentRepoImpl(ApiService(Dio())))..fetchParent(),
          ),
          BlocProvider(
            create: (context) =>
                SettingCubit(SettingRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                SendMassageCubit(SettingRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) =>
                FavoriteViewCubit(FavoriteRepoImpl(ApiService(Dio()))),
          ),
          BlocProvider(
            create: (context) => DrawerCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  PostSellerCubit(PostSellerRepoImpl(ApiServiceSeller(Dio())))),
          BlocProvider(
              create: (context) => SingInSellerCubit(
                  AuthSellerRepoImpl(ApiServiceSeller(Dio())))),
          BlocProvider(
              create: (context) =>
                  AuthShopCubit(AuthShopRepoImpl(ApiShop(Dio())))),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          // locale:const Locale('ar') ,
          // // initialRoute: AppRoutes.homeView,
          onGenerateRoute: (settings) => Routes.onGenerate(settings),
          //    home:Test(),
        ),
      ),
    );
  }
}
