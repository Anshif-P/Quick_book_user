import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class TextWidgetLoginSignin extends StatelessWidget {
  final String text;
  const TextWidgetLoginSignin({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 28,
      )),
    );
  }
}
