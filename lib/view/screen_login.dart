import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/login_bloc/login_bloc.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/text_widget.dart';
import 'package:hotel_booking_user_app/utils/validation.dart';
import 'package:hotel_booking_user_app/view/screen_parent_bottom_navigation.dart';
import 'package:hotel_booking_user_app/view/screen_signup.dart';
import 'package:permission_handler/permission_handler.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../blocs/rooms_bloc/rooms_bloc.dart';
import '../blocs/user_bloc/user_bloc.dart';
import '../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../resource/components/comman/textfeild.dart';
import '../resource/components/signup_login_widgets/divider_widget.dart';

class ScreenLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool loadingCheck = false;

  ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeightTemp = MediaQuery.sizeOf(context).height;
    double safeAreaSize = MediaQuery.of(context).padding.top;
    double screenHeight = screenHeightTemp - safeAreaSize;

    double widthHeight = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: screenHeight * 0.37,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/asset/image/Rectangle 12 (1).png'),
                    fit: BoxFit.cover),
                //  color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70))),
          ),
          Container(
            //   color: Colors.yellow,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: screenHeight * 0.43,
            child: Form(
              key: loginFormKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    const textWidgetLoginSignin(
                        text: 'Find Your Favorite Hotels To Stay'),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    TextFieldWidget(
                      hintText: 'enter your email',
                      controller: emailController,
                      icon: Icons.person,
                      text: 'Username',
                      validator: (value) => Validations.emailValidation(value),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    TextFieldWidget(
                      hintText: 'enter your password',
                      controller: passwordController,
                      icon: Icons.person,
                      text: 'Password',
                      validator: (value) => Validations.emtyValidation(value),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.20,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.green,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) => loginValidation(context, state),
                builder: (context, state) {
                  return ButtonWidget(
                      loadingCheck: loadingCheck,
                      onpressFunction: () {
                        _requestPermissions(context);
                      },
                      text: 'Log In',
                      colorCheck: true);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              const DividerWidget(),
              const SizedBox(
                height: 5,
              ),
              ButtonWidget(
                loadingCheck: false,
                onpressFunction: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ScreenSignUp()));
                },
                text: 'Sign Up',
                colorCheck: false,
                borderCheck: true,
              )
            ]),
          )
        ],
      ),
    );
  }

  loginFunction(BuildContext context) {
    if (loginFormKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginCheckEvent(
          email: emailController.text, password: passwordController.text));
    }
  }

  loginValidation(BuildContext context, state) {
    if (state is LoginLoadingState) {
      loadingCheck = true;
    }
    if (state is LoginErrorState) {
      loadingCheck = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(state.errorMessage),
        backgroundColor: CustomColors.mainColor,
      ));
    }
    if (state is LoginSuccessState) {
      context.read<UserBloc>().add(UserTokenChecking());
      final token = SharedPrefModel.instance.getData('token');
      context.read<RoomsBloc>().add(FetchBookedRoomsEvent(token: token));
      context.read<UserBloc>().add(FetchUserData(token: token));
      context.read<HomeBloc>().add(GetAllRoomsEvent());

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenParentNavigation()));
    }
  }

  Future<void> _requestPermissions(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage] == PermissionStatus.granted) {
      loginFunction(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'To Continue, please enable the Storage permission in the app settings')));
    }
  }
}
