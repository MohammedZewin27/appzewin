import 'dart:io';

import 'package:sahel_net/core/utils/api/api_service.dart';
import 'package:sahel_net/core/utils/theme/strings_manager.dart';
import 'package:share_plus/share_plus.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CustomLaunchUrl {
  ///launchUrlWhatsapp
  static Future<void> launchUrlWhatsapp(
      {required numPhone,
      required String name,
      required String urlPreview}) async {
// String num='966';
    var androidUrl =
        "whatsapp://send?phone=$numPhone&text=${AppString.appName} \n $name\n"
        // " $linkImage$urlPreview "
        ;
    var iosUrl = "https://wa.me/$numPhone?text=${Uri.parse(name)}";
    var desktopUrl =
        "https://wa.me/$numPhone/?text=${Uri.parse(name)}&type=$numPhone&app_absent=1";
    var webUrl = "https://web.whatsapp.com/send?phone=$numPhone&text=$name";

    try {
      if (Platform.isIOS) {
        await launchUrl(
          Uri.parse(iosUrl),
        );
      } else if (Platform.isAndroid) {
        await launchUrl(Uri.parse(androidUrl));
      } else if (Platform.isWindows) {
        await launchUrl(Uri.parse(desktopUrl));
      } else {
        await launchUrl(Uri.parse(webUrl));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ///launchUrlShare
  static Future<void> launchUrlShare({
    required title,
    required urlPreview,
    details,
    phone,
  }) async {
    try {
      Uri url = Uri.parse('$linkImage$urlPreview');
      // await Share.shareUri(url);
      var response = await http.get(url);

      Share.shareXFiles(
        [
          XFile.fromData(response.bodyBytes,
              name: title, mimeType: 'image/png'),
        ],
        subject: '${AppString.appName}  \n'
            ' ${title.trim()}',
        text: '         ---------------         \n'
            '${title.trim()}\n'
            '$details\n'
            '$phone\n'
            '         ---------------         \n'
            ' تطبيق ${AppString.appName}',
      );

      // await Share.share(
      //   '\n$linkImage$urlPreview\n'
      //       '         ---------------         \n'
      //       '${title.trim()}\n'
      //       '${phone.trim()}\n'
      //       '         ---------------         \n'
      //       ' تطبيق ${AppString.appName}',
      //   subject: '${AppString.appName} - ${title.trim()}',
      //   sharePositionOrigin: Rect.fromCircle(
      //     center: Offset(10, 10),
      //     radius: 20,
      //   ),
      // );
    } catch (e) {
      print(e.toString());
    }
  }

  ///launchUrlCall
  static Future<void> launchUrlCall(
      {required numPhone, String? messageSms}) async {
    var androidUrl = 'tel:$numPhone';
    var iosUrl = 'tel:$numPhone';
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else if (Platform.isAndroid) {
        await launchUrl(Uri.parse(androidUrl));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ///launchUrlLocation
  static Future<void> launchUrlLocation({
    required String location,
  }) async {
    var uri = Uri.parse(location);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> launchUserPolicy() async {
    var webUrl = "$launchPolicy/UserPolicy.php";

    try {
      await launchUrl(Uri.parse(webUrl));
    } catch (e) {
      print(e.toString());
    }
  }
  static Future<void> launchShopPolicy() async {
    var webUrl = "$launchPolicy/ShopPolicy.php";

    try {
      await launchUrl(Uri.parse(webUrl));
    } catch (e) {
      print(e.toString());
    }
  }
  static Future<void> launchSellerPolicy() async {
    var webUrl = "$launchPolicy/SellerPolicy.php";

    try {
      await launchUrl(Uri.parse(webUrl));
    } catch (e) {
      print(e.toString());
    }
  }
}
