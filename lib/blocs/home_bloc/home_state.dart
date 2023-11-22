part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

class HomeFetchRoomsSuccessState extends HomeState {
  List<RoomsModel> totalRoomList = [];
  List<List<RoomsModel>> categoryRooms = [];
  HomeFetchRoomsSuccessState(
      {required this.totalRoomList, required this.categoryRooms});
}

class HomeFetchErrorState extends HomeState {
  String errorMessage;
  HomeFetchErrorState({required this.errorMessage});
}
