part of 'bookings_bloc.dart';

abstract class BookingsEvent {}

class FetchBookingDates extends BookingsEvent {
  DateTimeRange dates;
  var mobNumber;
  var startDate;
  var endDate;
  var bookingsData;
  var address;
  RoomsModel data;
  var guest;
  var rooms;
  FetchBookingDates(
      {required this.mobNumber,
      required this.dates,
      required this.address,
      required this.data,
      required this.guest,
      required this.rooms,
      required this.startDate,
      required this.endDate,
      required this.bookingsData});
}
