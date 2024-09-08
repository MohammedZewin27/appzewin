import 'package:flutter/material.dart';
import 'package:sahel_net/core/utils/theme/color_manager.dart';
import 'package:sahel_net/core/utils/widgets/my_box_container.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({
    super.key,
    this.onSelected,
  });

  final void Function(String)? onSelected;


  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon:
      // Container(
      //   padding: EdgeInsets.symmetric(vertical: 4),
      //   decoration: BoxDecoration(
      //     color: ColorManager.backGround,
      //     borderRadius: BorderRadius.all(Radius.circular(8))
      //   ),
     
          // child:
          const Icon(Icons.more_vert),
    // ),
    
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
              value: 'Edit',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.edit_note,
                    color: Colors.green,
                  ),
                  Text('تعديل'),

                ],
              )),

          const PopupMenuItem(
            value: 'Delete',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                ),
                Text('حذف'),

              ],
            ),
          ),
        ];
      },
      onSelected: onSelected,
    );
  }
}