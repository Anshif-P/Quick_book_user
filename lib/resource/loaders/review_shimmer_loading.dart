import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:shimmer/shimmer.dart';

class RatingReviewShimmerLoadingWidget extends StatelessWidget {
  const RatingReviewShimmerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 250,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          color: Colors.white, // Shimmer background color
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 80,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 31,
                          color: Colors.white, // Shimmer background color
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 10,
                          color: Colors.white, // Shimmer background color
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 0.2,
              color: CustomColors.blackColor,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // You can replace this with Shimmer loading effect
                    // based on your ReviewWidget implementation.
                    Container(
                      height: 100,
                      color: Colors.white, // Shimmer background color
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
