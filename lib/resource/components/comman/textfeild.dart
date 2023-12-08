// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final bool textFieldSizeCheck;
  final FormFieldValidator validator;
  final bool keybordType;

  const TextFieldWidget(
      {super.key,
      required this.text,
      required this.hintText,
      this.keybordType = false,
      required this.controller,
      required this.icon,
      required this.validator,
      this.textFieldSizeCheck = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          // height: 48,
          // width: textFieldSizeCheck ? 162 : null,
          child: TextFormField(
            onEditingComplete: () {
              FocusScope.of(context).nextFocus();
            },
            keyboardType: keybordType ? TextInputType.number : null,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: CustomColors.lightGreyColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(
                icon,
                color: text != 'Property Location'
                    ? CustomColors.textFeildIconColor
                    : CustomColors.mainColor,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              hintText: hintText,
              hintStyle: const TextStyle(color: CustomColors.hintTextColor),
            ),
          ),
        ),
      ],
    );
  }
}
