import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/booking_bloc/bookings_bloc.dart';
import 'package:hotel_booking_user_app/blocs/home_bloc/home_bloc.dart';
import 'package:hotel_booking_user_app/blocs/login_bloc/login_bloc.dart';
import 'package:hotel_booking_user_app/blocs/signup_bloc/signup_bloc.dart';
import 'package:hotel_booking_user_app/blocs/user_bloc/user_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/view/screen_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefModel.instance.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => BookingsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSplash(),
      ),
    );
  }
}
