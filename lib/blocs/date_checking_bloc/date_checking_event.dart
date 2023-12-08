part of 'date_checking_bloc.dart';

abstract class DateCheckingEvent {}

class GetAvailableDatesEventf extends DateCheckingEvent {
  dynamic startDate;
  dynamic endDate;
  final RoomsModel data;

  GetAvailableDatesEventf(this.startDate, this.endDate, this.data);
}
