import 'package:flutter/material.dart';
import 'package:sahel_net/Features/home/presentation/cubit/home_cubit.dart';
import 'package:sahel_net/Features/search/preasention/view_model/search_cubit.dart';
import 'package:sahel_net/Features/search/preasention/views/widget/search_body.dart';

import '../../../drawer/presentation/pages/drawer_view.dart';

import '../../../parent/presentation/cubit/parent_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchCubit.get(context).fetchResultSearch(
        search: '', idParent: ParentCubit.get(context).parentId);
    return Scaffold(
      // backgroundColor: Colors.transparent,
      // appBar: buildAppBar(context),
      drawer: HomeCubit.get(context).isSettingDataUserActive
          ? const CustomDrawer()
          : null,
      body: const SearchBody(),
    );
  }
}
