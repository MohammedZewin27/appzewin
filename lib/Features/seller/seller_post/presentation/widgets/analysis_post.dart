import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../core/utils/widgets/text_analysis_product.dart';
import '../../../core/api/api_service_seller.dart';
import '../../../seller_analysis/data/models/my_data_pie_chart_section_data.dart';
import '../../../seller_analysis/presentation/widgets/pie_chart_body.dart';
import '../../data/repositories/post_seller_repo_impl.dart';
import '../cubit/social_media_product_cubit.dart';

class AnalysisPost extends StatelessWidget {
  const AnalysisPost({super.key, required this.idProduct});

  final int idProduct;

  @override
  Widget build(BuildContext context) {
    print(idProduct);
    return BlocProvider(
      create: (context) =>
          SocialMediaProductCubit(PostSellerRepoImpl(ApiServiceSeller(Dio())))
            ..getFullAnalysisProduct(idProduct: idProduct),
      child: BlocBuilder<SocialMediaProductCubit, SocialMediaProductState>(
        builder: (context, state) {
          if (state is SocialMediaProductFailure) {
            return Text(state.errorMessage);
          }
          if (state is SocialMediaProductLoading) {
            return const Center(child: CustomProgressIndicator());
          }
          if (state is SocialMediaProductSuccess) {
            var call =
                state.analysisProductModel.analysisProduct?.callProductData ??
                    [];
            var sharing = state
                    .analysisProductModel.analysisProduct?.sharingProductData ??
                [];
            var location = state.analysisProductModel.analysisProduct
                    ?.locationProductData ??
                [];
            var favorite = state.analysisProductModel.analysisProduct
                    ?.favoriteProductData ??
                [];
            var entry =
                state.analysisProductModel.analysisProduct?.entryProductData ??
                    [];
            var whatsApp = state.analysisProductModel.analysisProduct
                    ?.whatsAppProductData ??
                [];
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
            return AnalysisPostBody(
                myList: myList,
                call: call,
                sharing: sharing,
                location: location,
                favorite: favorite,
                entry: entry,
                whatsApp: whatsApp);
          } else {
            return const Center(child: CustomProgressIndicator());
          }
        },
      ),
    );
  }
}

class AnalysisPostBody extends StatefulWidget {
  const AnalysisPostBody({
    super.key,
    required this.myList,
    required this.call,
    required this.sharing,
    required this.location,
    required this.favorite,
    required this.entry,
    required this.whatsApp,
  });

  final List myList;
  final List call;
  final List sharing;
  final List location;
  final List favorite;
  final List entry;
  final List whatsApp;

  @override
  State<AnalysisPostBody> createState() => _AnalysisPostBodyState();
}

class _AnalysisPostBodyState extends State<AnalysisPostBody> {
  int touchedIndex = 1;
  double startDegreeOffset = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.5,
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            children: [
              TextAnalysisProduct(
                value: widget.call.length,
                title: 'الاتصال',
              ),
              TextAnalysisProduct(
                value: widget.sharing.length,
                title: 'مشاركة',
              ),
              TextAnalysisProduct(
                value: widget.location.length,
                title: 'موقع',
              ),
              TextAnalysisProduct(
                value: widget.entry.length,
                title: 'مشاهدة',
              ),
              TextAnalysisProduct(
                value: widget.whatsApp.length,
                title: 'واتساب',
              ),
              TextAnalysisProduct(
                value: widget.favorite.length,
                title: 'المفضلة',
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: PieChart(
            PieChartData(
                sections: widget.myList.asMap().entries.map(
                  (mapEntry) {
                    final index = mapEntry.key;
                    final data = mapEntry.value;
                    final isTouched = touchedIndex == index;
                    final isLast = isTouched;
                    return PieChartSectionData(
                      title: '',
                      borderSide: BorderSide(
                          width: 4,
                          color:
                              isLast ? ColorManager.white : Colors.transparent),
                      badgeWidget: data.icon,
                      value: data.value,
                      color: data.color,
                      radius: isTouched ? 65 : 55,
                    );
                  },
                ).toList(),
                centerSpaceRadius: 30,

                /// حجم
                centerSpaceColor: Colors.transparent,
                sectionsSpace: 1,
                startDegreeOffset: startDegreeOffset,

                /// تلف
                pieTouchData: PieTouchData(
                  touchCallback: (e, r) {
                    // print(r.toString());
                    if (r != null && r.touchedSection != null) {
                      setState(() {
                        touchedIndex = r.touchedSection!.touchedSectionIndex;
                      });
                    }
                  },
                )),
            swapAnimationDuration: const Duration(milliseconds: 300),
            swapAnimationCurve: Curves.bounceInOut,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary7),
                  onPressed: () {
                    setState(() {
                      startDegreeOffset = startDegreeOffset + 45;
                    });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.rotate_right_outlined,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.red),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      Text(
                        'الغاء',
                        style: AppStyles.styleRegular14.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
