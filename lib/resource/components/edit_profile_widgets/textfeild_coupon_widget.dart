import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CouponTextFeildWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController controller;

  final FormFieldValidator validator;

  const CouponTextFeildWidget({
    super.key,
    required this.text,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

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
          child: TextFormField(
            style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 14)),
            onEditingComplete: () {
              FocusScope.of(context)
                  .nextFocus(); // Move focus to the next field
            },
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.red), // Set the border color when focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.red), // Set the border color when focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.black), // Set the border color when focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color(
                        0xFFD1D1D1)), // Set the border color when not focused
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xFF999999)),
            ),
          ),
        ),
      ],
    );
  }
}
