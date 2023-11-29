import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/rating_review_model.dart';

class ViewAllButton extends StatelessWidget {
  final VoidCallback onpressFunction;
  const ViewAllButton({
    super.key,
    required this.reviewData,
    required this.onpressFunction,
  });
  final List<ReviewModel> reviewData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  const Size.fromWidth(double.maxFinite)),
              elevation: MaterialStateProperty.all(0),
              side: MaterialStateProperty.all<BorderSide>(BorderSide(
                color: CustomColors.blackColor,
                width: 0.7, // Set the border width
              )),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: onpressFunction,
            child: Text(
              'View all ${reviewData.length} Reviews',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: CustomColors.blackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
            )));
  }
}
