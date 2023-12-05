import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';

class AppText {
  static TextStyle get xSmall => TextStyle(
        fontSize: 11.5,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Colors.grey[500],
      );
  static TextStyle get smallDark => const TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 132, 132, 132),
      );

  static TextStyle get smallLight => const TextStyle(
        fontSize: 12,
        color: CustomColors.lightGreyColor,
      );
  static TextStyle get mediumdark => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: CustomColors.lightGreyColor,
      );
  static TextStyle get darkTerms => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: CustomColors.blackColor,
      );
  static TextStyle get mediumLight => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle get largeDark => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CustomColors.mainColor,
      );
  static TextStyle get dark => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CustomColors.blackColor,
      );
  static TextStyle get largeLight => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
  static TextStyle get xLarge => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: CustomColors.mainColor,
      );
}
