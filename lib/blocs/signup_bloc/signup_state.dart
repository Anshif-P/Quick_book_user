part of 'signup_bloc.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

abstract class SignupActionSate extends SignupState {}

class SignupSuccessState extends SignupActionSate {}

class SignupLoadingState extends SignupState {}

class SignupErrorState extends SignupState {
  String message;
  SignupErrorState({required this.message});
}
