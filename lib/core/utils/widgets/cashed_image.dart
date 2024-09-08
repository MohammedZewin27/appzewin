import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../api/api_service.dart';
import 'custom_progress_indicator.dart';

// class CachedImage extends StatelessWidget {
//   const CachedImage({
//     super.key,
//     required this.url,
//   });
//
//   final String url;
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: url,
//       fit: BoxFit.fill,
//       width: MediaQuery.sizeOf(context).width,
//       placeholder: (context, url) => const Center(
//         child: CustomProgressIndicator(),
//       ),
//       errorWidget: (context, url, error) => const Center(
//         child: Icon(Icons.error),
//       ),
//     );
//   }
// }

String getFileExtensionFromUrl(String url) {
  List<String> parts = url.split('.');
  String lastPart = parts.last;
  List<String> extensionParts = lastPart.split('?');
  String extension = extensionParts.first;
  return extension;
}

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.url,
    this.height,
    this.width, this.sizeIndicator,
  });

  final String url;
  final double? height;
  final double? width;
  final double? sizeIndicator;

  @override
  Widget build(BuildContext context) {
    return getFileExtensionFromUrl(url) == 'svg'
        ? SvgPicture.network(
            url.isNotEmpty
                ?
                '$linkImage$url'
                : '',
            fit: BoxFit.fill,

            placeholderBuilder: (context) =>  Center(
              child: CustomProgressIndicator(size: sizeIndicator??28,),
            ),
          )
        : CachedNetworkImage(

            height: height,
            width: width ?? MediaQuery.sizeOf(context).width,

            imageUrl: url.isNotEmpty
                ?
                '$linkImage$url'
                : '',
            fit: BoxFit.fill,
            placeholder: (context, url) =>  Center(
              child: CustomProgressIndicator(size: sizeIndicator??28,),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error),
            ),
          );
  }
}
