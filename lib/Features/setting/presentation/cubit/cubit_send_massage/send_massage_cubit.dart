import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_date.dart';
import '../../../data/repos/setting_repo.dart';


part 'send_massage_state.dart';

class SendMassageCubit extends Cubit<SendMassageState> {
  SendMassageCubit(this.settingRepo) : super(SendMassageInitial());

  final SettingRepo settingRepo;

  static SendMassageCubit get(context) => BlocProvider.of(context);

  ///                  send user massage
  Future<void> sendUserMassage( {  required String userId,
    required String title,
    required String subject,
    required String type,}) async {
    emit(AddUserMassageLoading());
    var result = await settingRepo.sendMassageFromUser(
        userId: userId, title: title, subject: subject, type: type);

    result.fold(
          (failure) {
        emit(AddUserMassageFailure(failure.errorMessage));
      },
          (serviceRequestModel) {

        emit(AddUserMassageSuccess(
            massageRequestModel: serviceRequestModel));
      },
    );
  }

}
