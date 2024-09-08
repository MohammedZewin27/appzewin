import 'package:flutter/material.dart';
import 'package:sahel_net/Features/favorite/presentation/cubit/favorite_view_cubit.dart';
import 'package:sahel_net/Features/hiraj/presentation/cubit/hiraj_cubit.dart';

import '../../../../core/utils/cash_data.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../parent/presentation/cubit/parent_cubit.dart';
import '../widgets/favorite_body.dart';




class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteViewCubit.get(context).fetchFavoriteView(parentId: ParentCubit.get(context).parentId);
    return PopScope(
      onPopInvoked: (didPop) {
        HomeCubit.get(context).fetchHome(idParent: CacheData.getData(key: StringCache.idParent));
        HirajCubit.get(context).fetchHiraj(idParent: CacheData.getData(key: StringCache.idParent));
      },
      child: const Scaffold(

        body: FavoriteBody(),
      ),
    );
  }
}
