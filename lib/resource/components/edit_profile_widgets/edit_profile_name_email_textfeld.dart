import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/custom_colors.dart';

class EditNameEmailTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final double screenHeight;
  final double screenwidth;
  final FormFieldValidator validation;

  final String hintText;

  const EditNameEmailTextFeild({
    super.key,
    required this.validation,
    required this.screenHeight,
    required this.screenwidth,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: GoogleFonts.inter(
              textStyle: const TextStyle(fontSize: 14, color: Colors.black)),
          validator: validation,
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: Colors.red),
            border: InputBorder.none,
            isDense: true,
            constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF999999)),
          ),
          controller: controller,
        ),
        const Divider(
          height: 0,
          thickness: 1,
          color: CustomColors.lightGreyColor,
        )
      ],
    );
  }
}
