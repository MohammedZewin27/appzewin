
import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/cubit/home_cubit.dart';
import 'package:sahel_net/Features/setting/presentation/cubit/setting_cubit.dart';
import '../../../drawer/presentation/pages/drawer_view.dart';
import '../widgets/body_card_user_data.dart';
import '../widgets/gird_items_setting.dart';
import '../widgets/header_setting.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    SettingCubit.get(context).fetchParent();
    return Scaffold(
      drawer:
      // HomeCubit.get(context).isSettingDataUserActive
      //     ?
      const CustomDrawer(),
          // : null,
      body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HeaderSetting(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).width / 5,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              const SliverToBoxAdapter(
                child: BodyCardUserData(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const GirdItemsSetting(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),

            ],
          )


    );
  }
}
//
// class AdvertisementSetting extends StatelessWidget {
//   const AdvertisementSetting({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (BuildContext context, HomeState state) {
//         if(state is AllCategorySuccess){
//        return   dataDialogAdvertisement.length > 1||dataDialogAdvertisement.isNotEmpty
//               ? CustomAdvertisementItemSetting(
//             imageAdvertisement: dataDialogAdvertisement[1].imageDialogAdvertisement??'',
//           )
//               : const SizedBox();
//         }else{
//           return SizedBox();
//         }
//       },
//     );
//   }
// }
//
// class CustomAdvertisementItemSetting extends StatefulWidget {
//   const CustomAdvertisementItemSetting({
//     super.key,
//     required this.imageAdvertisement,
//   });
//
//   final String imageAdvertisement;
//
//   @override
//   _CustomAdvertisementItemSettingState createState() =>
//       _CustomAdvertisementItemSettingState();
// }
//
// class _CustomAdvertisementItemSettingState
//     extends State<CustomAdvertisementItemSetting>
//     with TickerProviderStateMixin {
//   bool isAdVisible = false;
//   late Timer _timer;
//   late Timer _timerEnd;
//
//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer(const Duration(seconds: 5), () {
//       setState(() {
//         isAdVisible = true;
//       });
//     });
//     _timerEnd = Timer(const Duration(seconds: 15), () {
//       setState(() {
//         isAdVisible = false;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     _timerEnd.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedOpacity(
//       opacity: isAdVisible ? 1.0 : 0.0, // تغيير الشفافية حسب الحالة
//       duration: const Duration(milliseconds: 500), // مدة الانتقال بين الشفافيات
//       child: AspectRatio(
//         aspectRatio: 5.5,
//         child: CachedImage(
//           url: widget.imageAdvertisement,
//           height: double.infinity,
//         ),
//       ),
//     );
//   }
// }
