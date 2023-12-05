import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/user_bloc/user_bloc.dart';
import 'package:hotel_booking_user_app/model/user_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/textfeild.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/utils/validation.dart';
import '../resource/components/comman/heading_text_widget.dart';
import '../resource/components/edit_profile_widgets/bottomsheet_container.dart';
import '../resource/components/edit_profile_widgets/textfeild_coupon_widget.dart';

class ScreenEdit extends StatefulWidget {
  ScreenEdit({super.key, required this.userDetails});
  final UserModel userDetails;

  @override
  State<ScreenEdit> createState() => _ScreenEditState();
}

class _ScreenEditState extends State<ScreenEdit> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileNoController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController conformPasswordController = TextEditingController();

  GlobalKey<FormState> editUserInfoFormKey = GlobalKey<FormState>();

  bool buttonLoading = false;

  final passwordEditFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.userDetails.name;
    emailController.text = widget.userDetails.email;
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeightTemp = MediaQuery.sizeOf(context).height;
    final double screenTopPadding = MediaQuery.of(context).padding.top;
    double screenHeight = screenHeightTemp - screenTopPadding;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: CustomColors.extraLightGrey,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topCenter,
              // color: Colors.red,
              height: screenHeight * 0.06,
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child:
                              //  IconButton(
                              //     onPressed: () {
                              //       Navigator.of(context).pop();
                              //       // Get.back();
                              //     },
                              //     icon: const Icon(Icons.arrow_back)),
                              InkWell(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: const Icon(Icons.arrow_back)),
                        ),
                      ),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      const Expanded(
                        flex: 1,
                        child: HeadingTextWidget(
                          text: 'Edit Profile',
                          sizeCheck: true,
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              alignment: Alignment.center,
              // color: Colors.yellow,
              height: screenHeight * 0.5,
              child: Form(
                key: editUserInfoFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                        text: 'Name',
                        hintText: 'enter name',
                        controller: nameController,
                        icon: Icons.person,
                        validator: ((value) =>
                            Validations.emtyValidation(value)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                        text: 'Email',
                        hintText: 'enter email',
                        controller: emailController,
                        icon: Icons.email,
                        validator: ((value) =>
                            Validations.emtyValidation(value)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // TextFieldWidget(
                      //   text: 'Phone Number',
                      //   hintText: 'enter mobile number',
                      //   controller: mobileNoController,
                      //   icon: Icons.call,
                      //   validator: ((value) =>
                      //       Validations.emtyValidation(value)),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: CustomColors.lightGreyColor),
                            borderRadius: BorderRadius.circular(7)),
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            customBottomSheet(context, passwordEditFormKey);
                          },
                          child: Row(children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Colors.red,
                                  child: const Icon(
                                    Icons.lock,
                                    color: CustomColors.lightGreyColor,
                                  ),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  // color: Colors.green,
                                  child: const CustomTextWidget(
                                      text: 'Change Password',
                                      color: CustomColors.blackColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Colors.blue,
                                  child: const Icon(
                                      Icons.keyboard_arrow_right_rounded),
                                ))
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // color: Colors.green,
              height: screenHeight * 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      child: BlocConsumer<UserBloc, UserState>(
                        listener: (context, state) {
                          if (state is EditUserLoadingState) {
                            buttonLoading = true;
                          }
                          if (state is EditUserSuccessState) {
                            buttonLoading = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Profile Edited Successfully')));

                            Navigator.of(context).pop();
                          }
                          if (state is EditUserErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)));
                            buttonLoading = false;
                          }
                        },
                        builder: (context, state) {
                          return ButtonWidget(
                              onpressFunction: () {
                                validationFunction(context);
                              },
                              loadingCheck: buttonLoading,
                              text: 'Update',
                              colorCheck: true);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  validationFunction(BuildContext context) {
    if (editUserInfoFormKey.currentState!.validate()) {
      Map map = {"name": nameController.text, "email": emailController.text};
      context.read<UserBloc>().add(EditUserProfileEvent(map));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Fill All fields')));
    }
  }
}
