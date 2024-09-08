import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sahel_net/core/utils/cash_data.dart';


part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit() : super(AnalysisInitial());



  static AnalysisCubit get(context) => BlocProvider.of(context);


  void highestRating() {
    emit(AnalysisHighestRating());
  }
  void allDataPost() {
    emit(AnalysisAllDataPost());
  }
  void lowestRating() {
    emit(AnalysisLowestRating());
  }

  void postActive() {
    emit(AnalysisActive());
  }

  void postUnActive() {
    emit(AnalysisUnActive());
  }
}
