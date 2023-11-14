part of 'bookings_bloc.dart';

abstract class BookingsState {}

final class BookingsInitial extends BookingsState {}

class BookingDateAvailableState extends BookingsState {}

class BookingLoadingState extends BookingsState {}

class BookingErrorState extends BookingsState {
  String errorMessage;
  BookingErrorState({required this.errorMessage});
}

class BookingSuccessState extends BookingsState {}

class BookingDateNotAvailableState extends BookingsState {
  String errorMessage;
  BookingDateNotAvailableState({required this.errorMessage});
}
