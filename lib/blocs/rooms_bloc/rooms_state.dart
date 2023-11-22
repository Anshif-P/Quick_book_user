part of 'rooms_bloc.dart';

abstract class RoomsState {}

final class RoomsInitial extends RoomsState {}

abstract class RoomActionState extends RoomsState {}

class FetchBookedRoomsSuccessState extends RoomsState {
  List<BookedRoomModel> roomList = [];
  FetchBookedRoomsSuccessState({required this.roomList});
}

class FetchBookedRoomsErrorState extends RoomsState {
  String errorMessage;
  FetchBookedRoomsErrorState({required this.errorMessage});
}

class CancelBookingSuccessState extends RoomActionState {}

class CancelBookingErrorState extends RoomActionState {
  String errorMessage;
  CancelBookingErrorState({required this.errorMessage});
}

class CancelBookingLoadingState extends RoomActionState {}
