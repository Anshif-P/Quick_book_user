part of 'date_checking_bloc.dart';

abstract class DateCheckingEvent {}

class GetAvailableDatesEventf extends DateCheckingEvent {
  final startDate;
  final endDate;
  final RoomsModel data;

  GetAvailableDatesEventf(this.startDate, this.endDate, this.data);
}
