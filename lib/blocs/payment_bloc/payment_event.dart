part of 'payment_bloc.dart';

abstract class PaymentEvent {}

class PaymentStartEvent extends PaymentEvent {
  String mobNumber;
  String totalAmount;
  String propertyName;
  PaymentStartEvent(
      {required this.mobNumber,
      required this.propertyName,
      required this.totalAmount});
}

class PaymentSuccessEvent extends PaymentEvent {}

class PaymentFailedEvent extends PaymentEvent {}
