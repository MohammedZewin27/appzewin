part of 'social_media_product_cubit.dart';

@immutable
sealed class SocialMediaProductState {}

final class SocialMediaProductInitial extends SocialMediaProductState {}
final class SocialMediaProductLoading extends SocialMediaProductState {}
class SocialMediaProductFailure extends SocialMediaProductState {
  final String errorMessage;

  SocialMediaProductFailure(this.errorMessage);
}

class SocialMediaProductSuccess extends SocialMediaProductState {
  final AnalysisProductModel analysisProductModel;

  SocialMediaProductSuccess({required this.analysisProductModel});
}