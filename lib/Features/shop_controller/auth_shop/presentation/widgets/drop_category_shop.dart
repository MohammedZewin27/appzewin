import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/cubit/auth_shop_cubit.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../cubit/categoryShopCubit/category_shop_cubit.dart';
import '../cubit/sub_category_shop_cubit/sub_category_shop_cubit.dart';


class DropDownChooseShopCategory extends StatelessWidget {
  const DropDownChooseShopCategory({
    super.key,
    this.parentId, this.validator,
  });

  final int? parentId;
  final String? Function(dynamic)? validator;


  @override
  Widget build(BuildContext context) {
    CategoryShopCubit.get(context)
        .fetchShopCategories(parentId: AuthShopCubit.get(context).parentId ?? 0);
    return BlocBuilder<CategoryShopCubit, CategoryShopState>(
      builder: (context, state) {
        print(AuthShopCubit.get(context).parentId );
        if (state is CategoryShopSuccess) {
          print(CategoryShopSuccess);
          var data = state.shopCategoryModel.categoriesData ?? [];
          List<DropdownMenuItem> listDrop = data.map((itemsData) {
            return DropdownMenuItem(
                value: data.indexOf(itemsData),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CachedImage(
                          sizeIndicator: 5,
                          url: itemsData.categoryImage ?? '',
                          height: 25,
                          width: 25,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        itemsData.categoryName ?? '',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ));
          }).toList();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(12),
              child: DropdownButtonFormField(
                onChanged: (value) {
                  // AuthShopCubit.get(context).categoryShop = data[value].categoryId;
                  AuthShopCubit.get(context).parentId = data[value].parentId;
                  AuthShopCubit.get(context).categoryId = data[value].categoryId;
                  SubCategoryShopCubit.get(context)
                      .fetchShopSubCategories(categoriesId:AuthShopCubit.get(context).categoryId??0);
                },
                validator:validator ,
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: ColorManager.primary7,
                    fontSize: 18),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  hintTextDirection: TextDirection.rtl,
                ),

                autovalidateMode: AutovalidateMode.onUserInteraction,
                items: listDrop,
              ),
            ),
          );
        } else if (state is AuthShopLoading) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(12),
              child: DropdownButtonFormField(

                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: ColorManager.primary7,
                      fontSize: 18),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    hintTextDirection: TextDirection.rtl,
                  ),
                  value: 100,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  items: const [
                    DropdownMenuItem(
                      value: 100,
                      child: Center(child: Text('')),
                    )
                  ],
                  onChanged: (v) {}),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(12),
            child: DropdownButtonFormField(
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: ColorManager.primary7,
                    fontSize: 18),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  hintTextDirection: TextDirection.rtl,
                ),
                value: 100,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                items: const [
                  DropdownMenuItem(
                    value: 100,
                    child: Center(child: Text('')),
                  )
                ],
                onChanged: (v) {}),
          ),
        );
      },
    );
  }
}