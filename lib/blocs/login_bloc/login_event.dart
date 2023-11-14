part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginCheckEvent extends LoginEvent {
  String email;
  String password;
  LoginCheckEvent({required this.email, required this.password});
}
