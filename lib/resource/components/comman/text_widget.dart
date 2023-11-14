import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textWidgetLoginSignin extends StatelessWidget {
  final String text;
  const textWidgetLoginSignin({super.key, required this.text});

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
