part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

final class BookingInitial extends BookingState {}

class BookingErrorState extends BookingState {
  final String errorMessage;
  BookingErrorState({required this.errorMessage});
}

class BookingSuccessState extends BookingState {}

class BookingLoadinState extends BookingState {}
