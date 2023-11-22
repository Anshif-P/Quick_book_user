import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RateUsBookAgainButtonWidget extends StatelessWidget {
  final String text;
  final bool colorCheck;
  final bool borderCheck;
  final VoidCallback onpressFunction;
  final bool loadingCheck;
  final bool reviewButtonCheck;
  final bool radiusCheck;
  const RateUsBookAgainButtonWidget(
      {super.key,
      required this.radiusCheck,
      this.reviewButtonCheck = false,
      required this.onpressFunction,
      required this.text,
      required this.colorCheck,
      this.loadingCheck = false,
      this.borderCheck = false});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size.fromWidth(double.maxFinite),
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: radiusCheck
                  ? BorderRadius.only(bottomLeft: Radius.circular(8))
                  : BorderRadius.only(bottomRight: Radius.circular(8)),
            ),
          ),
          side: borderCheck
              ? MaterialStateProperty.all<BorderSide>(BorderSide(
                  color: Color(0xFFD1D1D1), // Set your desired border color
                  width: 1, // Set the border width
                ))
              : null,
          backgroundColor: MaterialStateProperty.all(
            colorCheck ? const Color(0xFFCB102F) : Colors.white,
          ),
        ),
        onPressed: onpressFunction,
        child: loadingCheck
            ? Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: colorCheck ? Colors.white : const Color(0xFF777777),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
      ),
    );
  }
}
