import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../../../../parent/data/models/parent_model.dart';
import '../cubit/auth_shop_cubit.dart';
import '../cubit/categoryShopCubit/category_shop_cubit.dart';

class DropDownChooseParentToShop extends StatelessWidget {
  const DropDownChooseParentToShop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthShopCubit.get(context).fetchParent();
    return BlocBuilder<AuthShopCubit, AuthShopState>(
      builder: (context, state) {
        if (state is ShopParentSuccess ) {
          var data = state.parentModel.dataParent ?? [];
          List<DropdownMenuItem> listDrop = data.map((itemsData) {
            return DropdownMenuItem(
                value: data.indexOf(itemsData),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: CachedImage(
                          url: itemsData.appLogo ?? '',
                          height: 35,
                          width: 35,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        itemsData.name ?? '',
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
                  onChanged: (v) {
                    DataParent dataParent = data[v];
                    AuthShopCubit.get(context).parentId = dataParent.id;
                    CategoryShopCubit.get(context).fetchShopCategories(
                        parentId: AuthShopCubit.get(context).parentId ?? 14);
                  }),
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