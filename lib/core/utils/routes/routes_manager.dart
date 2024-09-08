import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';

import '../../../Features/Layout/presentation/pages/layout.dart';
import '../../../Features/auth/presentation/views/sign_in_view.dart';
import '../../../Features/home/presentation/pages/home_view.dart';
import '../../../Features/parent/presentation/pages/choose_parent_view.dart';
import '../../../Features/splash/splash_view.dart';


class AppRoutes {

  static const String layout = 'layout';
  static const String signInView = 'signInView';
  static const String homeView = 'homeView';
  static const String welcomeScreen = 'WelcomeScreen';
  static const String splashView = '/';
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.layout:
        return MaterialPageRoute(
          builder: (context) =>  const Layout(),
        );
      case AppRoutes.homeView:
        return MaterialPageRoute(
          builder: (context) =>  const HomeView(),
        );
      case AppRoutes.signInView:
        return MaterialPageRoute(
          builder: (context) =>  const SignInView(dataParent: null,),
        );
      case AppRoutes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(
          builder: (context) => const ChooseParent(),
        );

      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppString.noRouteFound),
        ),
        body: const Center(
          child: Text(AppString.noRouteFound),
        ),
      ),
    );
  }
}
