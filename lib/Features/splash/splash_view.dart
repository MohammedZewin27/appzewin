import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/Layout/presentation/pages/layout.dart';

import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../core/utils/const/constant_manager.dart';

import '../../generated/assets.dart';
import '../parent/presentation/pages/choose_parent_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;

  startDelay() {
    timer = Timer(
        const Duration(seconds:
            AppConstants.splashDelay
            ),
        goNext);
  }

  goNext() {
    Navigator.pushReplacement(context, CupertinoPageRoute(
      builder: (context) {
        return StringCache.active ? const Layout() :
        // const ChooseUser();

        const ChooseParent();
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary7,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),

              SizedBox(
                height: MediaQuery.sizeOf(context).width * .25,
                width: MediaQuery.sizeOf(context).width * .25,
                child: Image.asset(
                  Assets.imagesLogo,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText
                 ('سهلنا لك',
                      speed: const Duration(milliseconds: 150),
                      textAlign: TextAlign.center,
                      textStyle: AppStyles.styleSemiBoldQahiri60)
                ],
                isRepeatingAnimation: false,
                repeatForever: true,
                displayFullTextOnTap: true,
                stopPauseOnTap: false,
              ),

            ],
          ),
        ),
      ),
    );


  }
}
