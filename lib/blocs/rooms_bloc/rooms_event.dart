part of 'rooms_bloc.dart';

abstract class RoomsEvent {}

class FetchBookedRoomsEvent extends RoomsEvent {
  String token;

  FetchBookedRoomsEvent({required this.token});
}

class CancelBookingEvent extends RoomsEvent {
  String bookingId;
  CancelBookingEvent({required this.bookingId});
}
