part of 'layout_shop_cubit.dart';

@immutable
sealed class LayoutShopState {}

final class LayoutShopInitial extends LayoutShopState {}
class LayoutIndex extends LayoutShopState {
  final int newIndex;
  LayoutIndex({this.newIndex = 3});
}