// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentStartEvent>(paymentStartEvent);
    on<PaymentSuccessEvent>(paymentSuccessEvent);
    on<PaymentFailedEvent>(paymentFailedEvent);
  }
  final _razorpay = Razorpay();
  FutureOr<void> paymentStartEvent(
      PaymentStartEvent event, Emitter<PaymentState> emit) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    final amountTemp = event.totalAmount;
    final amount = int.parse(amountTemp);
    final String propertyName = event.propertyName;
    final String mobileNumber = event.mobNumber;
    print(
        '------------------------------------------------------------------total price new -------------');
    print(amount);
    print(propertyName);
    print(mobileNumber);

    var options = {
      'key': 'rzp_test_c2uYTsjX7fZJVz',
      'amount': amount * 100,
      'name': 'Quick Book',
      'description': propertyName,
      'prefill': {'contact': mobileNumber, 'email': 'testRazorPay@gmail.com'}
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Success Payment :${response.paymentId}", timeInSecForIosWeb: 4);
    add(PaymentSuccessEvent());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Error Here :${response.code}", timeInSecForIosWeb: 4);
    add(PaymentFailedEvent());
  }

  FutureOr<void> paymentSuccessEvent(
      PaymentSuccessEvent event, Emitter<PaymentState> emit) {
    emit(PayementSuccessState());
  }

  FutureOr<void> paymentFailedEvent(
      PaymentFailedEvent event, Emitter<PaymentState> emit) {
    emit(PayementFailedState());
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    return super.close();
  }
}
