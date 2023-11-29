import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/hotel_details_widgets/stars_widget.dart';
import 'package:intl/intl.dart';

import '../../../model/rating_review_model.dart';
import '../../../view/screen_view_all_reviews.dart';
import 'view_all_review_button.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.reviewData});
  final List<ReviewModel> reviewData;
  @override
  Widget build(BuildContext context) {
    final ReviewModel reviewObj = reviewData[0];
    double stars = double.tryParse(reviewObj.stars) ?? 0.0;

    String createdAtString = reviewObj.createdAt;
    DateTime createdAtDateTime = DateTime.parse(createdAtString);
    String formattedDate = DateFormat('yyyy-MM-dd').format(createdAtDateTime);
    ;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
            text: reviewObj.userId.name,
            color: CustomColors.blackColor,
            fontSize: 9,
            fontWeight: FontWeight.w600),
        SizedBox(
          height: 2,
        ),
        Container(
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
              textStyle: TextStyle(
                  color: CustomColors.blackColor,
                  fontSize: 9,
                  fontWeight: FontWeight.w300)),
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextWidget(
            text: formattedDate,
            color: CustomColors.grey,
            fontSize: 9,
            fontWeight: FontWeight.w300),
        SizedBox(
          height: 15,
        ),
        ViewAllButton(
          reviewData: reviewData,
          onpressFunction: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  height: MediaQuery.sizeOf(context).height / 1.7,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 10,
                        // ),
                        CustomTextWidget(
                            text: 'Reviews ',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 15,
                                ),
                            itemCount: reviewData.length,
                            itemBuilder: (context, index) {
                              return ReviewListWidget(
                                  reviewObj: reviewData[index]);
                            })
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
      ],
    );
  }
}
