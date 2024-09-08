import 'package:flutter/material.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../../core/utils/theme/color_manager.dart';
import '../../../../core/utils/theme/strings_manager.dart';
import '../../../../core/utils/theme/styles_manager.dart';
import '../../../../core/utils/widgets/cashed_image.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('معلومات عن التطبيق'),
      ),
      body: Stack(
        children: [
          Opacity(
              opacity: .05,
              child:Center(child: Image.asset(Assets.imagesLogo))),
            //  CachedImage(url: CacheData.getData(key: StringCache.appLogo))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  titleAPP,
                  style: AppStyles.styleSemiBold18
                      .copyWith(color: ColorManager.blue),
                  textDirection: TextDirection.rtl,
                ),
                Text(
                  aboutUs,
                  textAlign: TextAlign.justify,
                  style: AppStyles.styleMedium12
                      .copyWith(fontWeight: FontWeight.w600),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String titleAPP = '  حول التطبيق :';
String aboutUs = '\n'
   
    'تطبيق ${AppString.appNameMaster} هو تطبيق يهدف إلى توفير خدمات متنوعة ومفيدة'
    'للمستخدمين عبر الهاتف المحمول.'
    '\n'
    '\n'
    '- يشمل تطبيق '
    '${AppString.appNameMaster} الخدمات المختلفة التي يمكن توفيرها عبر'
    'التطبيق'
    '\n'
    '\n'
    ' 1- المطاعم.'
    '\n'
    '2- الخدمات المنزلية.'
    '\n'
    ' 3- التسوق.'
    '\n'
    ' 4- الأماكن الترفيهية.'
    '\n'
    '\n'
    '- يعتمد تطبيق ${AppString.appNameMaster} على واجهة ${AppString.appNameMaster} الاستخدام تمكن المستخدمين من تصفح الخدمات المتاحة واختيار ما يناسب'
    'احتياجاتهم ومتطلباتهم.'
    '\n'
    '\n'
    '- يعتبر تطبيق ${AppString.appNameMaster} وسيلة ملائمة وسريعة للوصول إلى الخدمات المطلوبة بسهولة، دون الحاجة إلى زيارة المحلات التجارية أو التواصل مع الأفراد المعنيين شخصيا. يوفر هذا'
    'التطبيق راحة ووقتا قيما للمستخدمين ويعزز الكفاءة في تقديم'
    'الخدمات.'
    '\n'
    '\n'
    '- بشكل عام ... '
    '\n'
    'يهدف تطبيق ${AppString.appNameMaster} إلى تبسيط حياة المستخدمين وتوفير تجربة سلسة وممتعة في الوصول إلى'
    'الخدمات المختلفة التي يحتاجونها في حياتهم اليومية.'
    '\n'
    '\n'
    '- يوفر تطبيق سهلة جميع خدمات المنطقة السكنية التي تعيش بها فلا تحتاج الي شئ أخر للوصول لأي خدمة مهما كانت صغيرة'
    'او كبيرة'
    '\n'
    '\n'
    'يعمل علي راحة العميل من حيث تقديم جميع الخدمات و المراكز'
    'التجارية والمنشأت الخاصة والعامة'
    '\n'
    '\n'
    'يتيح لك معرفه أماكن الخدمة و الإتصال بها او مراسلتها من'
    ' خلال الواتساب الخاص بالخدمة. ';
