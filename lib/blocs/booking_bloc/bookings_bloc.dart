import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/repositories/room_repo.dart';
import '../../model/booking_dates_model.dart';
part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  BookingsBloc() : super(BookingsInitial()) {
    on<FetchBookingDates>(fetchBookingDates);
  }
  // final _razorpay = Razorpay();

  FutureOr<void> fetchBookingDates(
      FetchBookingDates event, Emitter<BookingsState> emit) async {
    emit(BookingLoadingState());
    print('hellow ----------------------------in bloc');
    final checkIn = DateTime.parse(event.startDate).toLocal().toLocal();
    final checkOut = DateTime.parse(event.endDate).toLocal();

    final checkInWithoutTime =
        DateTime(checkIn.year, checkIn.month, checkIn.day);
    final checkOutWithoutTime =
        DateTime(checkOut.year, checkOut.month, checkOut.day);
    bool isAvailable = false;
    final either =
        await RoomRepositories().getAllBookedRoomDates(event.data.id);
    either.fold(
        (error) =>
            emit(BookingDateNotAvailableState(errorMessage: error.message)),
        (response) async {
      final List rawDates = response['dates'] as List;
      print(".......................................8iiiiiiiiiiiiiiiiiiiiiiii");
      print(rawDates);
      final List<BookingDate?> dates = rawDates
          .map((e) {
            return e['isCancel'] == false ? BookingDate.fromJson(e) : null;
          })
          .where((date) => date != null)
          .toList();

      print(
          'after rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print(dates.length);
      isAvailable = true;
      if (dates.isNotEmpty) {
        print(checkInWithoutTime);
        print(checkOutWithoutTime);
        int i = 0;
        for (var bookedDate in dates) {
          i++;
          // final bookedCheckIn = bookedDate!.checkIn;
          // final bookedCheckOut = bookedDate.checkOut;
          final bookedCheckIn = bookedDate!.checkIn.toLocal();
          final bookedCheckOut = bookedDate.checkOut.toLocal();
          print('lol00000000000000000000000000');
          print('${bookedCheckIn}$i');
          print("${bookedCheckOut}$i");
          print(isAvailable);
          if (checkInWithoutTime.isBefore(bookedCheckOut) &&
              checkOutWithoutTime.isAfter(bookedCheckIn)) {
            print(
                'hai ---------------------------------is this false in form in loop${isAvailable} ');
            isAvailable = false;
            // print(isAvailable);
            break;
          }
          print(isAvailable);
        }
      }

      if (isAvailable == false) {
        print('Date is not available  -------------------------------not ');
        emit(BookingDateNotAvailableState(
            errorMessage: 'Booking date not available'));
      }
      print('  last print ${isAvailable}');
    });
    if (isAvailable) {
      print(isAvailable);
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
            print(isAvailable);
            emit(BookingSuccessState());
            print('============================================success block');
            print(response);
          }
        },
      );
    }
  }
}
