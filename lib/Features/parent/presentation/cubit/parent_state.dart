part of 'parent_cubit.dart';

@immutable
sealed class ParentState {}

final class ParentInitial extends ParentState {}

class ParentLoading extends ParentState {}


class ParentFailure extends ParentState {
  final String errorMessage;

  ParentFailure(this.errorMessage);
}

class ParentSuccess extends ParentState {
  final ParentModel parentModel;

  ParentSuccess({required this.parentModel});
}

class ChangeParentLoading extends ParentState {}



class ChangeParentFailure extends ParentState {

}

class ChangeParentSuccess extends ParentState {

}