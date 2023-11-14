import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final bool paymentButtonCheck;
  final String text;
  final bool colorCheck;
  final bool borderCheck;
  final VoidCallback onpressFunction;
  final bool loadingCheck;
  const ButtonWidget(
      {super.key,
      this.paymentButtonCheck = false,
      required this.onpressFunction,
      required this.text,
      required this.colorCheck,
      this.loadingCheck = false,
      this.borderCheck = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  const Size.fromWidth(double.maxFinite)),
              elevation: MaterialStateProperty.all(0),
              side: borderCheck
                  ? MaterialStateProperty.all<BorderSide>(const BorderSide(
                      color: Color(0xFFD1D1D1), // Set your desired border color
                      width: 1, // Set the border width
                    ))
                  : null,
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                  colorCheck ? const Color(0xFFCB102F) : Colors.white),
            ),
            onPressed: onpressFunction,
            child: loadingCheck
                ? Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.white,
                    ))
                : Text(
                    text,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          color: colorCheck
                              ? Colors.white
                              : const Color(0xFF777777),
                          fontWeight: paymentButtonCheck
                              ? FontWeight.normal
                              : FontWeight.bold,
                          fontSize: 20),
                    ),
                  )));
  }
}