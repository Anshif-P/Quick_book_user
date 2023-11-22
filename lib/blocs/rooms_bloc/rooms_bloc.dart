import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/booked_rooms_model.dart';
import 'package:hotel_booking_user_app/repositories/room_repo.dart';
part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  RoomsBloc() : super(RoomsInitial()) {
    on<FetchBookedRoomsEvent>(fetchBookedRoomsEvent);
    on<CancelBookingEvent>(cancelBookingEvent);
  }
  List<BookedRoomModel> roomsObjList = [];

  String? token;
  FutureOr<void> fetchBookedRoomsEvent(
      FetchBookedRoomsEvent event, Emitter<RoomsState> emit) async {
    token = event.token;
    print(
        'inside the booked room bloc--------------------------------------------------------- @@@@@@@@@');

    final either = await RoomRepositories().getBookedRooms(token!);
    either.fold((error) {
      emit(FetchBookedRoomsErrorState(errorMessage: 'error'));
      print(
          '----------------------------------------------this is error state---------------------------');
      print(error.message);
    }, (response) {
      if (response['status'] != 'failed') {
        final List bookedRoomsList = response['bookedRooms'];
        print(bookedRoomsList);
        // for (int i = 0; i < bookedRoomsList.length; i++) {
        //   final roomObj = BookedRoomModel.fromJson(bookedRoomsList[i]);
        //   roomsObjList.add(roomObj);
        // }
        roomsObjList =
            bookedRoomsList.map((e) => BookedRoomModel.fromJson(e)).toList();
      }
      print('booked room get ---------------------------------success state');
      emit(FetchBookedRoomsSuccessState(roomList: roomsObjList));
    });
  }

  FutureOr<void> cancelBookingEvent(
      CancelBookingEvent event, Emitter<RoomsState> emit) async {
    emit(CancelBookingLoadingState());
    Map map = {'bookId': event.bookingId};
    final either = await RoomRepositories().cancelBooking(map);
    either.fold(
        (error) => emit(CancelBookingErrorState(errorMessage: error.message)),
        (response) {
      if (response['status'] != 'failed') {
        emit(CancelBookingSuccessState());
        roomsObjList.removeWhere((element) => element.id == event.bookingId);
        emit(FetchBookedRoomsSuccessState(roomList: roomsObjList));
      } else {
        emit(CancelBookingErrorState(errorMessage: response['message']));
      }
    });
  }
}
