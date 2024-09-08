part of 'setting_seller_cubit.dart';

@immutable
sealed class SettingSellerState {}

final class SettingSellerInitial extends SettingSellerState {}

class ChangeStatusSellerLoading extends SettingSellerState {}

class ChangeStatusSellerFailure extends SettingSellerState {
  final String errorMessage;

  ChangeStatusSellerFailure(this.errorMessage);
}

class ChangeStatusSellerSuccess extends SettingSellerState {
  // final DialogAdvertisementModel dialogAdvertisementModel;

  ChangeStatusSellerSuccess(//   {
      // required this.dialogAdvertisementModel}
      );
}
