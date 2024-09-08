// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/utils/theme/styles_manager.dart';
// import '../../../../core/utils/widgets/my_box_container.dart';
// import '../../../Layout/presentation/cubit/layout_cubit.dart';
//
// class CustomSearchBox extends StatelessWidget {
//   const CustomSearchBox({super.key, required this.hint});
//
//   final String hint;
//
//   @override
//   Widget build(BuildContext context) {
//     return MyBoxContainer(
//       child: TextField(
//         onTap: () {
//           context.read<TabCubit>().switchTab(2);
//         },
//         enabled: false,
//         textDirection: TextDirection.rtl,
//         decoration: InputDecoration(
//
//             prefixIcon: const Icon(Icons.search),
//             fillColor: Colors.white,
//             filled: true,
//             isDense: true,
//             contentPadding: const EdgeInsets.all(5),
//             hintStyle: AppStyles.styleRegular16.copyWith(
//               color: const Color(0xFFAAAAAA),
//             ),
//             hintText: hint,
//             border: buildBorder(),
//             enabledBorder: buildBorder(),
//             focusedBorder: buildBorder()),
//       ),
//     );
//   }
//
//   OutlineInputBorder buildBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(50),
//       borderSide: const BorderSide(color: Colors.transparent),
//     );
//   }
// }