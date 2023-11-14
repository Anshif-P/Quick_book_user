part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginSuccessState extends LoginActionState {}

class LoginErrorState extends LoginState {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginLoadingState extends LoginState {}
