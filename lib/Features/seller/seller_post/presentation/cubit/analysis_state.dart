part of 'analysis_cubit.dart';

@immutable
sealed class AnalysisState {}

final class AnalysisInitial extends AnalysisState {}


final class AnalysisHighestRating extends AnalysisState {}
final class AnalysisLowestRating extends AnalysisState {}
final class AnalysisActive extends AnalysisState {}
final class AnalysisUnActive extends AnalysisState {}
final class AnalysisAllDataPost extends AnalysisState {}
final class AnalysisNumberOfTimesSavedInTheFavorite extends AnalysisState {}
