import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/utils/validation.dart';

import '../../../blocs/user_bloc/user_bloc.dart';
import '../../const/custom_colors.dart';
import '../comman/comman_text_widget.dart';
import 'textfeild_coupon_widget.dart';

customBottomSheet(BuildContext context, passwordEditFormKey) {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool buttonLoading = false;

  return showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      // constraints:
      // BoxConstraints(maxHeight: double.maxFinite),
      context: context,
      builder: (context) => Form(
            key: passwordEditFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTextWidget(
                    text: 'Change Password',
                    color: CustomColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                const SizedBox(
                  height: 15,
                ),
                CouponTextFeildWidget(
                  controller: oldPasswordController,
                  hintText: 'Enter your old password',
                  text: 'Old Password',
                  validator: (value) => Validations.emtyValidation(value),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CouponTextFeildWidget(
                        controller: newPasswordController,
                        hintText: 'Enter new password',
                        text: 'New Password',
                        validator: (value) => Validations.emtyValidation(value),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CouponTextFeildWidget(
                        controller: confirmPasswordController,
                        hintText: 'Confirm new password',
                        text: 'Confirm Password',
                        validator: (value) =>
                            Validations.conformPasswordValidation(
                                newPasswordController.text, value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is PasswordChangedLoadingState) {
                      buttonLoading = true;
                    }
                    if (state is PasswordChangedSuccessState) {
                      buttonLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Password Edited Successfully')));

                      Navigator.of(context).pop();
                    }
                    if (state is PasswordChangedErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                      buttonLoading = false;
                    }
                  },
                  builder: (context, state) {
                    return ButtonWidget(
                        loadingCheck: buttonLoading,
                        onpressFunction: () {
                          validationFunction(
                              context,
                              passwordEditFormKey,
                              oldPasswordController,
                              newPasswordController,
                              confirmPasswordController);
                        },
                        text: 'Update',
                        colorCheck: true);
                  },
                ),
                const SizedBox(height: 10),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: MediaQuery.of(context).viewInsets.bottom,
                )
              ]),
            ),
          ));
}

validationFunction(
    BuildContext context,
    GlobalKey<FormState> passwordEditFormKey,
    TextEditingController oldpass,
    TextEditingController newPass,
    TextEditingController conPass) {
  if (passwordEditFormKey.currentState!.validate()) {
    Map map = {
      "password": oldpass.text,
      "newPass": newPass.text,
      "confimPass": conPass.text
    };
    context.read<UserBloc>().add(ChangePasswordEvent(map));
  }
}
