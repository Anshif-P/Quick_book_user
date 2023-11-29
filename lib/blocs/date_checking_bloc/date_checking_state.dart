part of 'date_checking_bloc.dart';

abstract class DateCheckingState {}

final class DateCheckingInitial extends DateCheckingState {}

class DateAvailableCheckLoadingState extends DateCheckingState {}

class BookingDataAvailable extends DateCheckingState {}

class BookingDateNotAvailableState extends DateCheckingState {
  String errorMessage;
  BookingDateNotAvailableState({required this.errorMessage});
}
