import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/repositories/authentication_repo.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<CreateAccountEvent>(createAccountEvent);
  }

  FutureOr<void> createAccountEvent(
      CreateAccountEvent event, Emitter<SignupState> emit) async {
    final userSignupData = {
      'name': event.name,
      'email': event.email,
      'mobile': event.mobileNumber,
      'password': event.password,
      'confirmPass': event.conformPassword
    };

    emit(SignupLoadingState());

    final either = await AuthenticationRepo().signUpUser(userSignupData);
    either.fold((error) => emit(SignupErrorState(message: error.message)),
        (response) {
      if (response['status'] == 'success') {
      } else {
        emit(SignupErrorState(message: response['message']));
      }
    });
    if (either.right['status'] == 'success') {
      final either = await AuthenticationRepo().conformSignUp(userSignupData);
      either.fold((error) => emit(SignupErrorState(message: error.message)),
          (response) {
        if (response['status'] == 'success') {
          emit(SignupSuccessState());
          SharedPrefModel.instance.insertData('token', response['token']);
        } else {
          emit(SignupErrorState(message: response['message']));
        }
      });
    }
  }
}
