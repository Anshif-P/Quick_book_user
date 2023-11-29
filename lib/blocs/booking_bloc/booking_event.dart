part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class BookRoomEvent extends BookingEvent {
  DateTimeRange dates;
  var mobNumber;
  var startDate;
  var endDate;
  var bookingsData;
  var address;
  RoomsModel data;
  var guest;
  var rooms;
  BookRoomEvent(
      {required this.mobNumber,
      required this.dates,
      required this.address,
      required this.data,
      required this.guest,
      required this.rooms,
      required this.bookingsData,
      required this.endDate,
      required this.startDate});
}
