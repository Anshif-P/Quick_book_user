import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingDetailsTextWidget extends StatelessWidget {
  final String text;
  final bool sizeCheck;
  const BookingDetailsTextWidget(
      {super.key, required this.text, this.sizeCheck = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: Colors.black,
        fontWeight: sizeCheck ? FontWeight.w600 : null,
        fontSize: sizeCheck ? 16 : 14,
      )),
    );
  }
}
