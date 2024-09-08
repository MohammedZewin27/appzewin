import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahel_net/Features/seller/seller_analysis/presentation/widgets/text_pie_chart_seller.dart';
import 'package:sahel_net/core/utils/widgets/text_analysis_product.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../data/models/analysis_seller_model.dart';
import '../../data/models/my_data_pie_chart_section_data.dart';

class PieChartBody extends StatefulWidget {
  const PieChartBody({super.key,
    required this.myList,
    required this.call,
    required this.sharing,
    required this.location,
    required this.favorite, required this.whatsApp, required this.entry});

  final List<MyDataPieChartSectionData> myList;
  final List<CallSellerData>  call;
  final List<SharingSellerData> sharing;
  final List<LocationSellerData> location;
  final List<FavoriteSellerData> favorite;
  final List<WhatsAppSellerData> whatsApp;
  final  List<EntrySellerData> entry;

  @override
  State<PieChartBody> createState() => _PieChartBodyState();
}

class _PieChartBodyState extends State<PieChartBody> {
  int touchedIndex = 6;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:

                [
                  ColorManager.primary7.withOpacity(.6),
                  ColorManager.primary7,
                  ColorManager.primary7.withOpacity(.6)
                ]
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent,
              ),
              child: AutoSizeText(
                'تحليل بيانات وسائل الاتصال',

                style: AppStyles.styleSemiBold18.copyWith(
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                childAspectRatio: 2.5,
                mainAxisSpacing: 5,
              ),
              children: [
                TextAnalysisProduct(
                  value: widget.call.length,
                  title: 'الاتصال',
                  color: Colors.green,
                  isActive: touchedIndex == 0,
                ),
                TextAnalysisProduct(
                  value: widget.sharing.length,
                  title: 'المشاركة',
                  color: Colors.amber,
                  isActive: touchedIndex == 1,
                ),
                TextAnalysisProduct(
                  value: widget.location.length,
                  title: 'الموقع',
                  color: Colors.blueAccent,
                  isActive: touchedIndex == 2,
                ),
                TextAnalysisProduct(
                  value: widget.favorite.length,
                  title: 'المفضلة',
                  color: Colors.redAccent,
                  isActive: touchedIndex == 3,
                ),
                TextAnalysisProduct(
                  value: widget.whatsApp.length,
                  title: 'واتساب',
                  color: Colors.greenAccent,
                  isActive: touchedIndex == 4,
                ),
                TextAnalysisProduct(
                  value: widget.entry.length,
                  title: 'الدخول ',
                  color: ColorManager.primary7,
                  isActive: true,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: PieChart(
              PieChartData(
                sections: widget.myList
                    .asMap()
                    .entries
                    .map(
                      (mapEntry) {
                    final index = mapEntry.key;
                    final data = mapEntry.value;
                    final isTouched = touchedIndex == index;
                    return PieChartSectionData(
                      title: '',
                      borderSide: BorderSide(
                        width: 4,
                        color: isTouched ? ColorManager.white : Colors.transparent,
                      ),
                      badgeWidget: data.icon,
                      value: data.value,
                      color: data.color,
                      radius: isTouched ? 65 : 55,
                    );
                  },
                ).toList(),
                centerSpaceRadius: 10,
                centerSpaceColor: Colors.transparent,
                sectionsSpace: 1,
                startDegreeOffset: 90,
                pieTouchData: PieTouchData(
                  touchCallback: (e, r) {
                    if (r != null && r.touchedSection != null) {
                      setState(() {
                        touchedIndex = r.touchedSection!.touchedSectionIndex;
                      });
                    }
                  },
                ),
              ),
              swapAnimationDuration: const Duration(milliseconds: 300),
              swapAnimationCurve: Curves.bounceInOut,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //
          //     GestureDetector(
          //         onTap: () {
          //           showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(
          //               2030,));
          //         },
          //         child: Text(DateTime.now().toString().substring(0,11))),
          //     Text(widget.entry[0].entryDateSeller!.substring(0,11)),
          //   ],
          // ),


        ],
      ),
    );

  }
}
