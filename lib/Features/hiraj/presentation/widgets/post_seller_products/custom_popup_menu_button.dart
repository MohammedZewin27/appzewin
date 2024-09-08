import 'package:flutter/material.dart';

import '../../../data/models/hiraj_model.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    this.onSelected, required this.productsSeller,
  });

  final void Function(String)? onSelected;
  final ProductData productsSeller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
              // onTap: () {
              //   CustomLaunchUrl.launchUrlCall(
              //       numPhone: productsSeller.seller!.hirajSellerData?[0]
              //           .phoneSeller);
              // },
              value: 'call',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                  Text('اتصال'),

                ],
              )),
          const PopupMenuItem(
            value: 'share',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.share,
                  color: Colors.green,
                ),
                Text('مشاركة'),

              ],
            ),
          ),
          const PopupMenuItem(
            value: 'chat',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.chat,
                  color: Colors.teal,
                ),
                Text('محادثة'),

              ],
            ),
          ),
        ];
      },
      onSelected: onSelected,
    );
  }
}
