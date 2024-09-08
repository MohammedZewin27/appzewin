part of 'social_media_seller_cubit.dart';

@immutable
sealed class SocialMediaSellerState {}

final class SocialMediaSellerInitial extends SocialMediaSellerState {}
final class SocialMediaSellerLoading extends SocialMediaSellerState {}
class SocialMediaSellerFailure extends SocialMediaSellerState {
  final String errorMessage;

  SocialMediaSellerFailure(this.errorMessage);
}

class SocialMediaSellerSuccess extends SocialMediaSellerState {
  final AnalysisSellerModel analysisSellerModel;

  SocialMediaSellerSuccess({required this.analysisSellerModel});
}