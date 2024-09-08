import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../generated/assets.dart';
import '../../../../parent/presentation/cubit/parent_cubit.dart';
import '../../view_model/search_cubit.dart';

class CustomBottomSheetChooseSearch extends StatefulWidget {
  const CustomBottomSheetChooseSearch({super.key});

  @override
  _CustomBottomSheetChooseSearchState createState() =>
      _CustomBottomSheetChooseSearchState();
}

class _CustomBottomSheetChooseSearchState
    extends State<CustomBottomSheetChooseSearch> {

  @override
  Widget build(BuildContext context) {
    var cubitSearch = SearchCubit.get(context);
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          ListTile(
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              width: 35,
              height: 35,
              child: Image.asset(Assets.imagesShops),
            ),
            title: const Text(
              'محلات ',
              style: AppStyles.styleBold14,
            ),
            trailing: Checkbox(
              value: cubitSearch.shopsChecked,
              onChanged: (value) {
                setState(() {
                  cubitSearch.shopsChecked = value!;
                  context
                      .read<SearchCubit>()
                      .fetchResultSearch(
                      search: cubitSearch.controllerWordSearch.text,
                      idParent: ParentCubit
                          .get(context)
                          .parentId);

                  print(value);
                });
              },
            ),
          ),
          ListTile(
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              width: 35,
              height: 35,
              child: Image.asset(Assets.imagesSellers),
            ),
            title: const Text(
              'بائعين',
              style: AppStyles.styleBold14,
            ),
            trailing: Checkbox(
              value: cubitSearch.sellersChecked,
              onChanged: (value) {
                setState(() {
                  cubitSearch.sellersChecked = value!;
                  context
                      .read<SearchCubit>()
                      .fetchResultSearch(
                      search: cubitSearch.controllerWordSearch.text,
                      idParent: ParentCubit
                          .get(context)
                          .parentId);

                  print(value);
                });
              },
            ),
          ),
          ListTile(
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              width: 35,
              height: 35,
              child: Image.asset(Assets.imagesProductes),
            ),
            title: const Text(
              'منتجات',
              style: AppStyles.styleBold14,
            ),
            trailing: Checkbox(
              value: cubitSearch.productsChecked,
              onChanged: (value) {
                setState(() {
                  cubitSearch.productsChecked = value!;
                  context
                      .read<SearchCubit>()
                      .fetchResultSearch(
                      search: cubitSearch.controllerWordSearch.text,
                      idParent: ParentCubit.get(context).parentId);

                  print(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}