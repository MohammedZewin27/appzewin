import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubitSeller extends Cubit<LayoutSellerState> {
  LayoutCubitSeller() : super(LayoutInitial());
  static LayoutCubitSeller get(context) => BlocProvider.of(context);
  late int newIndex=3;
  void changeIndex(int index) {
    newIndex=index;

    emit(AppUpdateIndex());
  }
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
}
