import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/blocs/home_bloc/home_bloc.dart';
import 'package:hotel_booking_user_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/view/screen_login.dart';
import 'package:hotel_booking_user_app/view/screen_parent_bottom_navigation.dart';
import '../blocs/user_bloc/user_bloc.dart';
import '../blocs/wishlist_bloc/wishlist_bloc.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(UserTokenChecking());
    return Scaffold(
      backgroundColor: const Color(0xFFCB102F),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) => userLoginValidation(context, state),
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'qb',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 106,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'quick book',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: .9,
                  child: const CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  userLoginValidation(BuildContext context, state) {
    if (state is UserTokenNotFoundState) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenLogin()));
    } else if (state is UserTokenFoundState) {
      print(
          '--------------------------------------------------dddddddddddddddddddddddd');
      context.read<RoomsBloc>().add(FetchBookedRoomsEvent(token: state.token));
      context.read<UserBloc>().add(FetchUserData(token: state.token));
    } else if (state is UserDataFetchSuccessState) {
      context.read<HomeBloc>().add(GetAllRoomsEvent());
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenParentNavigation()));
    }
  }
}
