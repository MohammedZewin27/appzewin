import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'layout_shop_state.dart';

class LayoutShopCubit extends Cubit<LayoutShopState> {
  LayoutShopCubit() : super(LayoutShopInitial());
  static LayoutShopCubit get(context) => BlocProvider.of(context);
  late int newIndex=2;
  void changeIndex(int index) {
    newIndex=index;

    emit(LayoutIndex());
  }
  GlobalKey<ScaffoldState> scaffoldKeySettingShop = GlobalKey<ScaffoldState>();
}
