import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/signup_bloc/signup_bloc.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/utils/validation.dart';
import 'package:hotel_booking_user_app/view/screen_home.dart';
import 'package:hotel_booking_user_app/view/screen_login.dart';
import '../resource/components/comman/textfeild.dart';
import '../resource/components/signup_login_widgets/divider_widget.dart';
import '../resource/components/signup_login_widgets/mobileno_textfeild.dart';

class ScreenSignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobNumberController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();
  final GlobalKey<FormState> singupFormKey = GlobalKey<FormState>();
  bool loadingCheck = false;
  ScreenSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.35,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/asset/image/Rectangle 12 (1).png'),
                      fit: BoxFit.cover),
                  // color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70))),
            ),
            Container(
                //    color: Colors.yellow,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: screenHeight * 0.44,
                child: Form(
                    key: singupFormKey,
                    child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          SizedBox(height: screenHeight * 0.03),
                          TextFieldWidget(
                            hintText: 'enter your name',
                            controller: nameController,
                            icon: Icons.person,
                            text: 'Name',
                            validator: (value) =>
                                Validations.emtyValidation(value),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextFieldWidget(
                            hintText: 'enter your email',
                            controller: emailController,
                            icon: Icons.mail,
                            text: 'Email Address',
                            validator: (value) =>
                                Validations.emailValidation(value),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          MobileNoTextField(
                              controller: mobNumberController,
                              contextMainScreen: context,
                              validation: (value) =>
                                  Validations.numberValidation(value)),
                          SizedBox(height: screenHeight * 0.02),
                          Row(children: [
                            Expanded(
                              child: TextFieldWidget(
                                hintText: 'create password',
                                controller: passwordController,
                                icon: Icons.key,
                                text: 'Password',
                                validator: (value) =>
                                    Validations.emtyValidation(value),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: TextFieldWidget(
                              hintText: 'confirm password',
                              controller: conformPasswordController,
                              icon: Icons.key,
                              text: 'Confirm Password',
                              validator: (value) =>
                                  Validations.conformPasswordValidation(
                                      value, passwordController.text),
                            ))
                          ])
                        ])))),
            Container(
              height: screenHeight * 0.21,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              //  color: Colors.green,
              child: SingleChildScrollView(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(
                    height: screenHeight * 0.025,
                  ),
                  BlocConsumer<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state is SignupSuccessState) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ScreenHome(),
                        ));
                      }
                      if (state is SignupErrorState) {
                        loadingCheck = false;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            backgroundColor: CustomColors.mainColor));
                      }
                      if (state is SignupLoadingState) {
                        loadingCheck = true;
                      }
                    },
                    builder: (context, state) {
                      return ButtonWidget(
                          loadingCheck: loadingCheck,
                          onpressFunction: () => signUpAddAccount(context),
                          text: 'Sign Up',
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
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ScreenLogin()));
                    },
                    text: 'Log In',
                    colorCheck: false,
                    borderCheck: true,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  signUpAddAccount(BuildContext context) {
    if (singupFormKey.currentState!.validate()) {
      context.read<SignupBloc>().add(CreateAccountEvent(
          name: nameController.text,
          email: emailController.text,
          mobileNumber: mobNumberController.text,
          password: passwordController.text,
          conformPassword: conformPasswordController.text));
    } else {}
  }
}
