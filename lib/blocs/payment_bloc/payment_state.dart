part of 'payment_bloc.dart';

abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

class PayementSuccessState extends PaymentState {}

class PayementFailedState extends PaymentState {}
