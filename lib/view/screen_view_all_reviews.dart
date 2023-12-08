import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/hotel_details_widgets/stars_widget.dart';
import 'package:intl/intl.dart';
import '../../../model/rating_review_model.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({super.key, required this.reviewObj});
  final ReviewModel reviewObj;
  @override
  Widget build(BuildContext context) {
    double stars = double.tryParse(reviewObj.stars) ?? 0.0;

    String createdAtString = reviewObj.createdAt;
    DateTime createdAtDateTime = DateTime.parse(createdAtString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(createdAtDateTime);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.lightGreyColor),
          borderRadius: BorderRadius.circular(8)),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
                text: reviewObj.userId.name,
                color: CustomColors.blackColor,
                fontSize: 9,
                fontWeight: FontWeight.w600),
            const SizedBox(
              height: 2,
            ),
            SizedBox(
              width: 40,
              //  color: Colors.blue,
              child: StartsWidget(
                rating: stars,
                review: reviewObj.feedback,
                height: 10,
                bottomTextCheck: false,
                sizeCheck: false,
              ),
            ),
            Text(
              reviewObj.feedback,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w300)),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextWidget(
                text: formattedDate,
                color: CustomColors.grey,
                fontSize: 9,
                fontWeight: FontWeight.w300),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
