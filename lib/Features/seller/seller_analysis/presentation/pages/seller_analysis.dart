import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/core/utils/theme/styles_manager.dart';
import '../../../core/api/function.dart';
import '../../../core/const.dart';
import '../../../seller_post/data/models/post_seller_model.dart';
import '../../../seller_post/presentation/cubit/post_seller_cubit.dart';
import '../../../sing_up_seller/data/models/seller_model.dart';
import '../cubit/social_media_seller_cubit.dart';
import '../widgets/custom_widget_analysis_seller.dart';
import '../widgets/pie_chart_analysis_seller.dart';

class SellerAnalysis extends StatelessWidget {
  const SellerAnalysis({super.key, this.sellerData});

  final SellerData? sellerData;

  @override
  Widget build(BuildContext context) {
    PostSellerCubit.get(context)
        .fetchPostOfSeller(sellerId: sellerData?.idHirajSeller ?? 0);
    return RefreshIndicator(
      onRefresh: () {
        return SocialMediaSellerCubit.get(context).getFullAnalysisSeller();
      },
      child: BlocBuilder<PostSellerCubit, PostSellerState>(
        builder: (context, state) {
          if (state is PostSellerSuccess) {
            dataPostToSeller =
                state.postSellerModel.product?.productsSeller ?? [];
            getPostActive(dataPostToSeller);

            /// get post active /// and get post unActive
          }
          return CustomScrollView(
            slivers: [
                SliverToBoxAdapter(
                child: AspectRatio(
                    aspectRatio: .9,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white60.withOpacity(.2), borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.all(20),

                        child: const PieChartAnalysisSeller())),
              ),
              //  SliverToBoxAdapter(
              //   child: Container(
              //       decoration: BoxDecoration(
              //           color: Colors.white60.withOpacity(.2), borderRadius: BorderRadius.circular(12)),
              //       margin: const EdgeInsets.all(20),
              //       child: BarChartSeller()),
              // ),
              const SliverToBoxAdapter(
                child: Divider(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            child: CustomWidgetAnalysisSeller(
                                text: 'تقييم',
                                details: sellerData!.ratingSeller.toString()),
                            onTap: () {
                              // AnalysisCubit.get(context).lowestRating();

                              /// اضافة اعلى تقيم
                            },
                          ),),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: InkWell(
                            child: CustomWidgetAnalysisSeller(
                                text: 'منتجات',
                                details: dataPostToSeller.length.toString()),
                            onTap: () {
                              // AnalysisCubit.get(context).allDataPost();
                            },
                          ),),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            child: CustomWidgetAnalysisSeller(
                                text: 'منتجات نشطة',
                                details: postActive.length.toString()),
                            onTap: () {
                              // AnalysisCubit.get(context).postActive();
                            },
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: InkWell(
                            child: CustomWidgetAnalysisSeller(
                                text: 'منتجات غير نشطة',
                                details: postUnActive.length.toString()),
                            onTap: () {
                              // AnalysisCubit.get(context).postUnActive();
                            },
                          )),
                        ],
                      ),

                    ],
                  ),
                ),
              ),

              // const AnalysisSellerBody(),
            ],
          );
        },
      ),
    );
  }
}

class BarChartSeller extends StatelessWidget {
  const BarChartSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: const EdgeInsets.all(10),
        // color: Colors.redAccent,
        child: BarChart(
          BarChartData(
            barGroups: [
              
              BarChartGroupData(x: 0,
              barRods: [
                BarChartRodData(toY: 10)
              ]
              
              ),
              BarChartGroupData(x: 0,
              barRods: [
                BarChartRodData(toY: 20)
              ]

              ),
              BarChartGroupData(x: 0,
                  barRods: [
                    BarChartRodData(toY: 15)
                  ]

              ),
              BarChartGroupData(x: 0,
                  barRods: [
                    BarChartRodData(toY: 25)
                  ]

              ),
            ],
            groupsSpace: 5,
            titlesData:FlTitlesData(
              leftTitles: 
              AxisTitles(
                axisNameWidget: Text('معدل النمو'),
                sideTitles: SideTitles(
                  reservedSize: 44,
                  showTitles: true,
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
