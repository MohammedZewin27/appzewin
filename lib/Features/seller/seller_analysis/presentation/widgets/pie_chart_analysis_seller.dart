import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/seller/seller_analysis/presentation/widgets/pie_chart_body.dart';
import 'package:sahel_net/core/utils/widgets/custom_progress_indicator.dart';

import '../../data/models/analysis_seller_model.dart';
import '../../data/models/my_data_pie_chart_section_data.dart';

import '../cubit/social_media_seller_cubit.dart';

class PieChartAnalysisSeller extends StatelessWidget {
  const PieChartAnalysisSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SocialMediaSellerCubit.get(context).getFullAnalysisSeller();
    return BlocBuilder<SocialMediaSellerCubit, SocialMediaSellerState>(
      builder: (context, state) {
        if (state is SocialMediaSellerSuccess) {
          List<CallSellerData> call =
              state.analysisSellerModel.analysisSeller?.callSellerData ?? [];
          List<SharingSellerData> sharing =
              state.analysisSellerModel.analysisSeller?.sharingSellerData ?? [];
          List<LocationSellerData>  location =
              state.analysisSellerModel.analysisSeller?.locationSellerData ??
                  [];
          List<FavoriteSellerData> favorite =
              state.analysisSellerModel.analysisSeller?.favoriteSellerData ??
                  [];
          List<WhatsAppSellerData> whatsApp =
              state.analysisSellerModel.analysisSeller?.whatsAppSellerData ??
                  [];
          List<EntrySellerData> entry =
              state.analysisSellerModel.analysisSeller?.entrySellerData ?? [];

          final myList = [
            MyDataPieChartSectionData(
              value: call.isNotEmpty ? call.length.toDouble() : 1,
              color: Colors.green,
              icon: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
            MyDataPieChartSectionData(
              value: sharing.isNotEmpty ? sharing.length.toDouble() : 1,
              color: Colors.amber,
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            MyDataPieChartSectionData(
              value: location.isNotEmpty ? location.length.toDouble() : 1,
              color: Colors.blueAccent,
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
            ),
            MyDataPieChartSectionData(
              value: favorite.isNotEmpty ? favorite.length.toDouble() : 1,
              color: Colors.redAccent,
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            MyDataPieChartSectionData(
              value: whatsApp.isNotEmpty ? whatsApp.length.toDouble() : 1,
              color: Colors.greenAccent,
              icon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
              ),
            ),
          ];
          return PieChartBody(
              entry: entry,
              myList: myList,
              call: call,
              whatsApp: whatsApp,
              sharing: sharing,
              location: location,
              favorite: favorite);
        } else if (state is SocialMediaSellerLoading) {
          return const Center(
            child: CustomProgressIndicator(
              color: Colors.white,
              size: 25,
            ),
          );
        } else {
          return const Center(
            child: CustomProgressIndicator(
              color: Colors.white,
              size: 25,
            ),
          );
        }
      },
    );
  }
}
