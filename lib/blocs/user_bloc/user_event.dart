part of 'user_bloc.dart';

abstract class UserEvent {}

class FetchUserData extends UserEvent {
  String token;
  FetchUserData({required this.token});
}

class EditUserProfileEvent extends UserEvent {
  final Map map;

  EditUserProfileEvent(this.map);
}

class ChangePasswordEvent extends UserEvent {
  final Map map;

  ChangePasswordEvent(this.map);
}

class UserTokenChecking extends UserEvent {}
