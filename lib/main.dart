import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/booking_bloc/booking_bloc.dart';
import 'package:hotel_booking_user_app/blocs/coupon_bloc/coupon_bloc.dart';
import 'package:hotel_booking_user_app/blocs/date_checking_bloc/date_checking_bloc.dart';
import 'package:hotel_booking_user_app/blocs/home_bloc/home_bloc.dart';
import 'package:hotel_booking_user_app/blocs/login_bloc/login_bloc.dart';
import 'package:hotel_booking_user_app/blocs/payment_bloc/payment_bloc.dart';
import 'package:hotel_booking_user_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking_user_app/blocs/search_bloc/search_bloc.dart';
import 'package:hotel_booking_user_app/blocs/signup_bloc/signup_bloc.dart';
import 'package:hotel_booking_user_app/blocs/user_bloc/user_bloc.dart';
import 'package:hotel_booking_user_app/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/view/screen_splash.dart';
import 'blocs/review_bloc/review_bloc.dart';

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
        BlocProvider(create: (context) => WishlistBloc()),
        BlocProvider(
            create: (context) => UserBloc(context.read<WishlistBloc>())),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => RoomsBloc()),
        BlocProvider(create: (context) => ReviewBloc()),
        BlocProvider(create: (context) => CouponBloc()),
        BlocProvider(create: (context) => PaymentBloc()),
        BlocProvider(create: (context) => BookingBloc()),
        BlocProvider(create: (context) => DateCheckingBloc()),
        BlocProvider(create: (context) => SearchBloc(context.read<HomeBloc>())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSplash(),
      ),
    );
  }
}
