part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}
final class ChangeIndexInitial extends DrawerState {}
