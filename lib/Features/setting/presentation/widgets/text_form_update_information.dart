import 'package:flutter/material.dart';

import '../../../../core/utils/theme/styles_manager.dart';

class TextFormUpdateInformation extends StatelessWidget {
  const TextFormUpdateInformation({
    super.key,
    required this.controller,
    this.validator,
    required this.title,
    required this.enabled,
    this.keyboardType, this.maxLines,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  final bool enabled;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines:maxLines??1 ,
              textDirection: TextDirection.rtl,
              enabled: enabled,
              textAlign: TextAlign.center,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
            ),
          ),
          Text(
            title,
            style: AppStyles.styleSemiBold16
                .copyWith(color: enabled ? Colors.black : Colors.grey),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}