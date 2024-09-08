import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahel_net/Features/search/preasention/views/widget/search_products_items.dart';
import 'package:sahel_net/Features/search/preasention/views/widget/search_sellers_items.dart';
import 'package:sahel_net/Features/search/preasention/views/widget/search_shops_items.dart';
import 'package:sahel_net/generated/assets.dart';

import '../../../../../core/utils/theme/color_manager.dart';
import '../../../../../core/utils/theme/styles_manager.dart';
import '../../../../../core/utils/widgets/custom_progress_indicator.dart';
import '../../../../../core/utils/widgets/logo_app_bar.dart';
import '../../../../../core/utils/widgets/my_box_container.dart';
import '../../../../hiraj/data/models/hiraj_model.dart';
import '../../../../hiraj/presentation/widgets/deatils_product/details_product_seller.dart';
import '../../../../hiraj/presentation/widgets/post_seller_products/post_seller_view.dart';
import '../../../../home/data/models/home_model.dart';
import '../../../../home/presentation/widgets/shop_body_view.dart';
import '../../../../parent/presentation/cubit/parent_cubit.dart';
import '../../view_model/search_cubit.dart';
import 'custom_bottom_sheet_choose_search.dart';
import 'custom_title_search.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({
    super.key,
  });

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var searchCubit = SearchCubit.get(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () {
          searchCubit.controllerWordSearch.clear();
          return SearchCubit.get(context).fetchResultSearch(
              search: '', idParent: ParentCubit.get(context).parentId);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: LogoAppBar(
                        size: 38,
                        isColorsWhite: false,
                      ),
                    ),
                    Expanded(
                      child:TextFormField(
                        onChanged: (value) {
                          setState(() {
                            String trimmedValue = value.trim(); // إزالة الفراغات من بداية ونهاية النص
                            if (trimmedValue.startsWith('0')) {
                              trimmedValue = trimmedValue.replaceFirst('0', ''); // استبدال أول صفر بالنص الفارغ
                            }if(trimmedValue.trim().isNotEmpty){
                              context.read<SearchCubit>().fetchResultSearch(
                                search: trimmedValue,
                                idParent: ParentCubit.get(context).parentId,
                              );
                            }

                          });
                        },


                      textAlign: TextAlign.center,
                        cursorRadius: const Radius.circular(10.0),
                        textDirection: TextDirection.rtl,
                        style: AppStyles.styleSemiBold16,
                        controller: searchCubit.controllerWordSearch,
                        decoration: InputDecoration(
                          hintStyle: AppStyles.styleSemiBoldQahiri3,
                          hintText: ' البحث بالاسم او رقم الجوال',
                          prefixIcon: Icon(
                            Icons.search,
                            color: ColorManager.primary7.withOpacity(.47),
                            size: 30,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: ColorManager.primary7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: ColorManager.primary7),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              const CustomBottomSheetChooseSearch(),
                        );
                      },
                      child: const MyBoxContainer(
                        radius: 8,
                        height: 50,
                        width: 50,
                        color: ColorManager.primary7,
                        child: Icon(
                          Icons.clear_all,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchSuccess) {
                      List<ShopsData> dataShops =
                          state.searchModel.shops?.shopsData ?? [];
                      List<HirajSellerData> dataSellers =
                          state.searchModel.hirajSeller?.hirajSellerData ?? [];
                      List<ProductData> dataProducts =
                          state.searchModel.products?.productData ?? [];
                      return Expanded(
                        child: CustomScrollView(
                          slivers: [
                            searchCubit.shopsChecked
                                ? const SliverToBoxAdapter(
                                    child: CustomTitleSearch(
                                      image: Assets.imagesShops,
                                      title: 'محلات',
                                    ),
                                  )
                                : const SliverToBoxAdapter(
                                    child: SizedBox(),
                                  ),
                            searchCubit.shopsChecked
                                ? SliverList.builder(
                                    itemCount: dataShops.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    ShopBodyView(
                                                  shopsData: dataShops[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: SearchShopsItems(
                                              shops: dataShops[index]));
                                    },
                                  )
                                : const SliverToBoxAdapter(
                                    child: SizedBox(),
                                  ),
                            searchCubit.sellersChecked
                                ? const SliverToBoxAdapter(
                                    child: CustomTitleSearch(
                                    image: Assets.imagesSellers,
                                    title: 'بائعين',
                                  ))
                                : const SliverToBoxAdapter(
                                    child: SizedBox(),
                                  ),
                            searchCubit.sellersChecked
                                ? SliverList.builder(
                                    itemCount: dataSellers.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    PostSeller(
                                                        hirajSellerData:
                                                            dataSellers[index]),
                                              ),
                                            );
                                          },
                                          child: SearchSellersItems(
                                              seller: dataSellers[index]));
                                    },
                                  )
                                : const SliverToBoxAdapter(
                                    child: SizedBox(),
                                  ),
                            searchCubit.productsChecked
                                ? const SliverToBoxAdapter(
                                    child: CustomTitleSearch(
                                    image: Assets.imagesProductes,
                                    title: 'منتجات',
                                  ))
                                : const SliverToBoxAdapter(
                                    child: SizedBox(),
                                  ),
                            searchCubit.productsChecked
                                ? SliverList.builder(
                                    itemCount: dataProducts.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    DetailsProductSeller(
                                                  showFavorite: true,
                                                  productsSeller:
                                                      dataProducts[index],
                                                  hirajSellerData:
                                                      dataProducts[index]
                                                          .seller!
                                                          .hirajSellerData?[0],
                                                ),
                                              ),
                                            );
                                          },
                                          child: SearchProductsItems(
                                              product: dataProducts[index]));
                                    },
                                  )
                                : const SliverToBoxAdapter(
                                    child: SizedBox(),
                                  ),
                          ],
                        ),
                      );
                    } else if (state is SearchFailure) {
                      return Text(state.errorMessage);
                    } else {
                      return
                      //   CustomRefreshIndicatorPage(
                      //   onRefresh: () {
                      //     return SearchCubit.get(context).fetchResultSearch(
                      //         search: '',
                      //         idParent: ParentCubit.get(context).parentId);
                      //   },
                      // );

                      Center(
                          child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height / 3),
                        child: const CustomProgressIndicator(),
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
