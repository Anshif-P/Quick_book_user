import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/model/user_model.dart';
import 'package:hotel_booking_user_app/repositories/authentication_repo.dart';
import 'package:hotel_booking_user_app/repositories/room_repo.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.wishlistBloc) : super(UserInitial()) {
    on<FetchUserData>(fetchUserData);
    on<UserTokenChecking>(userTokenChecking);
    on<EditUserProfileEvent>(editUserProfileEvent);
    on<ChangePasswordEvent>(changePasswordEvent);
  }
  String? token;
  UserModel? userDetails;
  final WishlistBloc wishlistBloc;

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

        userDetails = UserModel.fromJson(response['userDetails'], token);
        SharedPrefModel.instance.insertData('userId', userDetails!.id);
        wishlistBloc.add(
            GetWishlistRoomsEvent(token: event.token, userId: userDetails!.id));

        emit(UserDataFetchSuccessState(userDetails: userDetails!));
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

  FutureOr<void> editUserProfileEvent(
      EditUserProfileEvent event, Emitter<UserState> emit) async {
    emit(EditUserLoadingState());
    final either = await RoomRepositories().editUserDetails(event.map, token);
    either.fold((error) {
      emit(EditUserErrorState(error.message));
      emit(UserDataFetchSuccessState(userDetails: userDetails!));
    }, (response) {
      if (response['status'] != 'failed') {
        print('success');
        userDetails!.name = event.map['name'];
        userDetails!.email = event.map['email'];
        emit(EditUserSuccessState());

        emit(UserDataFetchSuccessState(userDetails: userDetails!));
      } else {
        emit(EditUserErrorState(response['message']));
        emit(UserDataFetchSuccessState(userDetails: userDetails!));
      }
    });
  }

  FutureOr<void> changePasswordEvent(
      ChangePasswordEvent event, Emitter<UserState> emit) async {
    emit(PasswordChangedLoadingState());
    final either = await RoomRepositories().changePassword(event.map, token);
    either.fold((error) {
      emit(PasswordChangedErrorState(errorMessage: error.message));
      emit(UserDataFetchSuccessState(userDetails: userDetails!));
    }, (response) {
      if (response['status'] != 'failed') {
        emit(PasswordChangedSuccessState());
        emit(UserDataFetchSuccessState(userDetails: userDetails!));
      } else {
        emit(PasswordChangedErrorState(errorMessage: response['message']));
        emit(UserDataFetchSuccessState(userDetails: userDetails!));
      }
    });
  }
}
