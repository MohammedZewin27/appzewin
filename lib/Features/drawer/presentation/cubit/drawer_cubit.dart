import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

static DrawerCubit get(context)=>BlocProvider.of(context);



 int indexItemsInDrawer=0;

changeIndexItemsDrawer({required int index}){
if(index==3){
  indexItemsInDrawer=0;
}else if(index==2){
  indexItemsInDrawer=1;
}else if(index==1){
  indexItemsInDrawer=2;
}else{
  indexItemsInDrawer=0;
}
  // indexItemsInDrawer=index;
  emit(ChangeIndexInitial());

}




}
