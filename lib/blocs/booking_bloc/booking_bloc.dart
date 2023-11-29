import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/shared_preferences/shared_pref_model.dart';
import '../../model/room_model.dart';
import '../../repositories/room_repo.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookRoomEvent>(bookRoomEvent);
  }

  FutureOr<void> bookRoomEvent(
      BookRoomEvent event, Emitter<BookingState> emit) async {
    emit(BookingLoadinState());
    final duration = event.dates.duration;
    final daysDifference = duration.inDays + 1;
    final tempPrice = int.parse(event.data.price);
    var totalAmount = daysDifference * tempPrice * event.rooms;
    Map bookingDetails = {
      "address": event.address,
      "phone": event.mobNumber,
      "place": event.data.location,
      "adult": event.guest,
      "check_in": event.startDate,
      "check_out": event.endDate,
      "roomCount": event.rooms,
      "dayPrice": totalAmount,
      "location": event.data.state,
      "price": totalAmount,
      "dayCount": daysDifference - 1,
      "type": event.data.propertyType,
      "total": totalAmount,
      "roomId": event.data.id,
      "vendorId": event.data.vendorId.id
    };

    final token = await SharedPrefModel.instance.getData('token');
    final either =
        await RoomRepositories().conformBookRoom(bookingDetails, token);
    either.fold(
      (error) => emit(BookingErrorState(errorMessage: error.message)),
      (response) {
        if (response['status'] != 'failed') {
          emit(BookingSuccessState());
          print('============================================success block');
          print(response);
        }
      },
    );
  }
}
