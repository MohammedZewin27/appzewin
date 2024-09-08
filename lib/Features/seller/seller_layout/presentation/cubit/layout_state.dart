part of 'layout_cubit.dart';

@immutable
sealed class LayoutSellerState {}

final class LayoutInitial extends LayoutSellerState {}
class AppUpdateIndex extends LayoutSellerState {
  final int newIndex;
  AppUpdateIndex({this.newIndex = 3});
}