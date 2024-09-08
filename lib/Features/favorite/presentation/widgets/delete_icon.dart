import 'package:flutter/material.dart';
import 'package:sahel_net/generated/assets.dart';


class DeleteIcon extends StatelessWidget {
  const DeleteIcon({
    super.key, required this.onTap,
  });

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  CircleAvatar(
          radius: 15,
          backgroundColor: Colors.black26,
        child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.white,
            child: Image.asset(Assets.imagesError,height: 12,width: 12,))

      ),
    );
  }
}