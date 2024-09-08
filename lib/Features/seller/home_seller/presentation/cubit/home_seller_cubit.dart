import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_seller_state.dart';

class HomeSellerCubit extends Cubit<HomeSellerState> {
  HomeSellerCubit() : super(HomeSellerInitial());
  static HomeSellerCubit get(context)=>BlocProvider.of(context);

}
