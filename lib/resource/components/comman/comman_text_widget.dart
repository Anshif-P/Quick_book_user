import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  const CustomTextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight)),
      overflow: TextOverflow.ellipsis,
    );
  }
}
