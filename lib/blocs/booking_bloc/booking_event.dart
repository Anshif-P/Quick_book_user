part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

// ignore: must_be_immutable
class BookRoomEvent extends BookingEvent {
  DateTimeRange dates;
  dynamic mobNumber;
  dynamic startDate;
  dynamic endDate;
  dynamic bookingsData;
  dynamic address;
  RoomsModel data;
  dynamic guest;
  dynamic rooms;
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
