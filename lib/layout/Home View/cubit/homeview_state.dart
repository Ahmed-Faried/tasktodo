part of 'homeview_cubit.dart';

@immutable
abstract class HomeViewState {}

class HomeViewInitial extends HomeViewState {}

class ChangeLocalState extends HomeViewState {}

class HomeChangeBottomNav extends HomeViewState {}


// class LoadingGetNotification extends HomeViewState {}
//
// class SuccessGetNotification extends HomeViewState {}
//
// class ErrorGetNotification extends HomeViewState {
//   final String error;
//   ErrorGetNotification(this.error);
// }
//
// class LoadingDeleteNotification extends HomeViewState {}
//
// class SuccessDeleteNotification extends HomeViewState {}
//
// class ErrorDeleteNotification extends HomeViewState {
//   final String error;
//   ErrorDeleteNotification(this.error);
// }