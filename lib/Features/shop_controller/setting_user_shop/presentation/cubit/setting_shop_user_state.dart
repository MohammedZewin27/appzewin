part of 'setting_shop_user_cubit.dart';

@immutable
sealed class SettingShopUserState {}

final class SettingShopUserInitial extends SettingShopUserState {}
final class SettingShopLoading extends SettingShopUserState {}
final class SettingShopFailure extends SettingShopUserState {
  final String errorMessage;

  SettingShopFailure(this.errorMessage);
}
class SettingShopSuccess extends SettingShopUserState {
  final AddShopInDatabaseModel dataShop;
  SettingShopSuccess({required this.dataShop});
}