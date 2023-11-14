import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/repositories/room_repo.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetAllRoomsEvent>(getAllRoomsEvent);
  }

  FutureOr<void> getAllRoomsEvent(
      GetAllRoomsEvent event, Emitter<HomeState> emit) async {
    List<RoomsModel> roomsObjList = [];
    final either = await RoomRepositories().getAllRoom();
    either
        .fold((error) => emit(HomeFetchErrorState(errorMessage: error.message)),
            (response) {
      if (response['status'] == 'failed') {
        emit(HomeFetchErrorState(errorMessage: response['message']));
      } else {
        List roomDataList = response['roomData'];
        for (int i = 0; i < roomDataList.length; i++) {
          final roomObj = RoomsModel.fromJson(roomDataList[i]);
          roomsObjList.add(roomObj);
        }
        print(
            'r-------------------------------------------response----------------get');
        print(roomsObjList[0].totalRooms);

        emit(HomeFetchRoomsSuccessState(totalRoomList: roomsObjList));
      }
    });
  }
}
