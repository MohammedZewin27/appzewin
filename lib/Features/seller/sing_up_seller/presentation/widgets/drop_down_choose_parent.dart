import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/shop_controller/auth_shop/presentation/cubit/auth_shop_cubit.dart';
import 'package:sahel_net/core/utils/widgets/cashed_image.dart';


import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../parent/data/models/parent_model.dart';
import '../../../../shop_controller/auth_shop/presentation/cubit/categoryShopCubit/category_shop_cubit.dart';
import '../cubit/cubit_category/category_cubit.dart';
import '../cubit/seller_cubit.dart';
/// seller
class DropDownChooseParentToSeller extends StatelessWidget {
  const DropDownChooseParentToSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SellerCubit.get(context).fetchParent();
    return BlocBuilder<SellerCubit, SellerState>(
      builder: (context, state) {
        if (state is SellerSuccess) {
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
                    SellerCubit.get(context).parentId = dataParent.id;
                    CategoryCubit.get(context).fetchCategories(
                        parentId: SellerCubit.get(context).parentId ?? 0);
                  }),
            ),
          );
        } else if (state is SellerLoading) {
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


/// shop
