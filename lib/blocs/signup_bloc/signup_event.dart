part of 'signup_bloc.dart';

abstract class SignupEvent {}

class CreateAccountEvent extends SignupEvent {
  String name;
  String email;
  String mobileNumber;
  String password;
  String conformPassword;
  CreateAccountEvent(
      {required this.name,
      required this.email,
      required this.mobileNumber,
      required this.password,
      required this.conformPassword});
}
