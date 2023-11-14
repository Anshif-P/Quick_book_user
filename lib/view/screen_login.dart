import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/login_bloc/login_bloc.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/text_widget.dart';
import 'package:hotel_booking_user_app/utils/validation.dart';
import 'package:hotel_booking_user_app/view/screen_parent_bottom_navigation.dart';
import 'package:hotel_booking_user_app/view/screen_signup.dart';

import '../blocs/home_bloc/home_bloc.dart';
import '../blocs/user_bloc/user_bloc.dart';
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
          Container(
            height: screenHeight * 0.20,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.green,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ScreenParentNavigation()));
                  }
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
                },
                builder: (context, state) {
                  return ButtonWidget(
                      loadingCheck: loadingCheck,
                      onpressFunction: () {
                        loginFunction(context, state);
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

  loginFunction(BuildContext context, state) {
    if (loginFormKey.currentState!.validate()) {
      context.read<LoginBloc>().add(LoginCheckEvent(
          email: emailController.text, password: passwordController.text));
      if (state is LoginSuccessState) {
        context.read<UserBloc>().add(UserTokenChecking());
      }
      if (state is UserTokenFoundState) {
        context.read<UserBloc>().add(FetchUserData(token: state.token));
        context.read<HomeBloc>().add(GetAllRoomsEvent());
      }
    } else {}
  }
}
