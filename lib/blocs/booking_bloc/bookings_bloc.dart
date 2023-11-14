import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/repositories/room_repo.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

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
    final checkIn = DateTime.parse(event.startDate);
    final checkOut = DateTime.parse(event.endDate);
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
      final dates = rawDates.map((e) => BookingDate.fromJson(e)).toList();

      print(
          'after rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      isAvailable = true;

      for (var bookedDate in dates) {
        final bookedCheckIn = bookedDate.checkIn;
        final bookedCheckOut = bookedDate.checkOut;

        if (checkIn.isBefore(bookedCheckOut) &&
            checkOut.isAfter(bookedCheckIn)) {
          isAvailable = false;
          break;
        } else if (isAvailable == false) {
          print('Date is not available  -------------------------------not ');
          emit(BookingDateNotAvailableState(
              errorMessage: 'Booking date not available'));
        }
      }
    });
    if (isAvailable) {
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

      // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

      // var options = {
      //   'key': 'rzp_test_Xw5LOmfbPD9rnu',
      //   'amount': totalAmount * 100,
      //   'name': 'Quick Book.',
      //   'description': 'Fine T-Shirt',
      //   'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
      // };

      // _razorpay.open(options);

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

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {}

  // void _handlePaymentError(PaymentFailureResponse response) {}
}
