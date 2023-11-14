part of 'user_bloc.dart';

abstract class UserEvent {}

class FetchUserData extends UserEvent {
  String token;
  FetchUserData({required this.token});
}

class UserTokenChecking extends UserEvent {}
