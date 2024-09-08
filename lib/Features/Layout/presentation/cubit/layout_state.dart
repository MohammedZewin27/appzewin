part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class LayoutSuccess extends LayoutState {
  final DialogAdvertisementModel dialogAdvertisementModel;

  LayoutSuccess({required this.dialogAdvertisementModel});
}

class LayoutLoading extends LayoutState {}
class LayoutChangeIndexTap extends LayoutState {}

class LayoutFailure extends LayoutState {
  final String errorMessage;

  LayoutFailure(this.errorMessage);
}
