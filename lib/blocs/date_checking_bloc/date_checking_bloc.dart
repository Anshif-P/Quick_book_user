import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';

import '../../model/booking_dates_model.dart';
import '../../repositories/room_repo.dart';

part 'date_checking_event.dart';
part 'date_checking_state.dart';

class DateCheckingBloc extends Bloc<DateCheckingEvent, DateCheckingState> {
  DateCheckingBloc() : super(DateCheckingInitial()) {
    on<GetAvailableDatesEventf>(getAvailableDatesEventf);
  }

  FutureOr<void> getAvailableDatesEventf(
      GetAvailableDatesEventf event, Emitter<DateCheckingState> emit) async {
    emit(DateAvailableCheckLoadingState());
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

      // print(
      //     'after rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      // print(dates.length);
      isAvailable = true;
      if (dates.isNotEmpty) {
        // print(checkInWithoutTime);
        // print(checkOutWithoutTime);
        // int i = 0;
        for (var bookedDate in dates) {
          // final bookedCheckIn = bookedDate!.checkIn;
          // final bookedCheckOut = bookedDate.checkOut;
          final bookedCheckIn = bookedDate!.checkIn.toLocal();
          final bookedCheckOut = bookedDate.checkOut.toLocal();
          // print('lol00000000000000000000000000');
          // print('${bookedCheckIn}$i');
          // print("${bookedCheckOut}$i");
          // print(isAvailable);
          if (checkInWithoutTime.isBefore(bookedCheckOut) &&
              checkOutWithoutTime.isAfter(bookedCheckIn)) {
            // print(
            //  'hai ---------------------------------is this false in form in loop${isAvailable} ');
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
      // print('  last print ${isAvailable}');
      if (isAvailable) {
        print('Date is  available  ------------------------------- ');
        emit(BookingDataAvailable());
      }
    });
  }
}
