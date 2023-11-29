import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/model/user_model.dart';
import 'package:hotel_booking_user_app/repositories/authentication_repo.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserData>(fetchUserData);
    on<UserTokenChecking>(userTokenChecking);
  }
  String? token;

  FutureOr<void> fetchUserData(
      FetchUserData event, Emitter<UserState> emit) async {
    final either = await AuthenticationRepo().getUserProfile(event.token);
    either.fold(
        (error) => emit(UserDataFetchErrorState(errorMessage: error.message)),
        (response) {
      if (response['status'] == 'failed') {
        print('respnse error state -------------------------------------');
        emit(UserDataFetchErrorState(errorMessage: response['message']));
      } else {
        print('respnse success state -------------------------------------');

        final userDetails = UserModel.fromJson(response['userDetails'], token);
        SharedPrefModel.instance.insertData('userId', userDetails.id);

        emit(UserDataFetchSuccessState(userDetails: userDetails));
      }
    });
  }

  FutureOr<void> userTokenChecking(
      UserTokenChecking event, Emitter<UserState> emit) {
    token = SharedPrefModel.instance.getData('token');
    if (token != null) {
      emit(UserTokenFoundState(token: token!));
      print('hai ------------------in token ture');
      print(token);
    } else {
      print(' ---------------------------worked else case');
      emit(UserTokenNotFoundState());
    }
  }
}
