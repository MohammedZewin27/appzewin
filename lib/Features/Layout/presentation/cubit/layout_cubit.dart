import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/variable.dart';
import '../../data/models/dialog_advertisement_model.dart';
import '../../data/repos/layout_repo.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit(this.layoutRepo) : super(LayoutInitial());
  final LayoutRepo layoutRepo;
  static LayoutCubit get(context) => BlocProvider.of(context);
  Future<void> fetchDialogAdvertisement({required int idParent}) async {
    emit(LayoutLoading());
    var result = await layoutRepo.fetchDialogAdvertisementModel(idParent);

    result.fold(
          (failure) {
        emit(LayoutFailure(failure.errorMessage));
      },
          (dialogAdvertisement) {
            dataDialogAdvertisementHome=dialogAdvertisement;
        emit(LayoutSuccess(dialogAdvertisementModel:dialogAdvertisement));
      },
    );
  }

  int indexPage = 3;

}



late CupertinoTabController tabController;
class TabCubit extends Cubit<int> {
  TabCubit() : super(3); // تعيين التبويب الافتراضي إلى الفهرس 0


  static TabCubit get(context) => BlocProvider.of(context);


  void switchTab(int tabIndex) {
    tabController.index=tabIndex;
    emit(tabIndex); // إصدار الفهرس الجديد للتبويب
  }
}
