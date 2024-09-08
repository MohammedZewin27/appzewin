import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/widgets/cashed_image.dart';
import '../cubit/cubit_category/category_cubit.dart';
import '../cubit/seller_cubit.dart';

class DropDownChooseCategory extends StatelessWidget {
  const DropDownChooseCategory({
    super.key,
    this.parentId, this.validator,
  });

  final int? parentId;
  final String? Function(dynamic)? validator;


  @override
  Widget build(BuildContext context) {
    CategoryCubit.get(context)
        .fetchCategories(parentId: SellerCubit.get(context).parentId ?? 0);
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {

          var data = state.sellerCategoryModel.hirajData ?? [];
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
                          url: itemsData.imageHiraj ?? '',
                          height: 25,
                          width: 25,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        itemsData.nameHiraj ?? '',
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
                  SellerCubit.get(context).hirajId = data[value].idHiraj;
                  SellerCubit.get(context).idParent = data[value].idParent;
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

