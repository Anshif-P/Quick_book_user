part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeFetchRoomsSuccessState extends HomeState {
  List<RoomsModel> totalRoomList = [];
  HomeFetchRoomsSuccessState({required this.totalRoomList});
}

class HomeFetchErrorState extends HomeState {
  String errorMessage;
  HomeFetchErrorState({required this.errorMessage});
}
