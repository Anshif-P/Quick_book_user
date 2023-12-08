import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/repositories/authentication_repo.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginCheckEvent>(loginCheckEvent);
  }
  FutureOr<void> loginCheckEvent(
      LoginCheckEvent event, Emitter<LoginState> emit) async {
    final userData = {'email': event.email, 'password': event.password};

    emit(LoginLoadingState());
    final either = await AuthenticationRepo().loginUser(userData);
    either.fold((error) => emit(LoginErrorState(errorMessage: error.message)),
        (response) {
      if (response['status'] == 'success') {
        emit(LoginSuccessState());
        SharedPrefModel.instance.insertData('token', response['token']);
      } else {
        emit(LoginErrorState(
            errorMessage: response['message'] ?? 'error occure'));
      }
    });
  }
}
