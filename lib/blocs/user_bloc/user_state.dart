part of 'user_bloc.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

class UserDataFetchSuccessState extends UserState {
  UserModel userDetails;
  UserDataFetchSuccessState({required this.userDetails});
}

class UserDataFetchErrorState extends UserState {
  String errorMessage;
  UserDataFetchErrorState({required this.errorMessage});
}

class UserTokenNotFoundState extends UserState {}

class UserTokenFoundState extends UserState {
  String token;
  UserTokenFoundState({required this.token});
}
