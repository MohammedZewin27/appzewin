import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sahel_net/Features/favorite/presentation/pages/favorite_view.dart';
import 'package:sahel_net/core/utils/cash_data.dart';
import 'package:sahel_net/core/utils/responsive%20size/responsive_size.dart';

import 'package:sahel_net/core/utils/theme/styles_manager.dart';

import '../../../../core/utils/function/call_me.dart';
import '../../../../core/utils/widgets/my_box_container.dart';
import '../../../Layout/presentation/cubit/layout_cubit.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Expanded(
                child: MyBoxContainer(
              height: getResponsiveSize(context, size: 55),
              radius: 20,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, elevation: 0),
                  onPressed: () {
                    // LayoutCubit.get(context).indexPage=1;
                    //  context.read<LayoutCubit>().indexPage=1;
                    context.read<TabCubit>().switchTab(1);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      const Spacer(),
                      Text(
                        'ابحث عن ما تريد',
                        style:
                            AppStyles.styleBold14.copyWith(color: Colors.grey),
                      ),
                      const Spacer(),
                    ],
                  )),
            )),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                CacheData.getData(key: StringCache.userId) != 0
                    ? Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return const FavoriteView();
                          },
                        ),
                      )
                    :  registerNow(context);
              },
              child: SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: Animator<double>(
                    duration: const Duration(seconds: 3),
                    cycles: 0,
                    curve: Curves.easeInOut,
                    tween: Tween<double>(begin: 20.0, end: 30.0),
                    builder: (context, animatorState, child) => Icon(
                      Icons.favorite,
                      size: animatorState.value * 1,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
