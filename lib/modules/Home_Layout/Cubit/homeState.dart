
import 'dart:collection';

abstract class HomeState {}
class InitHomeState extends HomeState{}
class ChangeBottomNavState extends HomeState{}
class ChangeAmountState extends HomeState{}
class LoadingDataState extends HomeState{}
class SuccessGetDataState extends HomeState{}
class ErrorGetDataState extends HomeState{
  final error;
  ErrorGetDataState(this.error);
}
class ChangeFilterState extends HomeState{}
class AddToCartState extends HomeState{}
class LoadingfirebaseState extends HomeState {}

class SuccesspushfirebaseState extends HomeState {}

class SuccessgetfirebaseState extends HomeState {}

class SuccessdeletefirebaseState extends HomeState {}

class ErrorfirebaseState extends HomeState {
  var error;
  ErrorfirebaseState(this.error);
}

