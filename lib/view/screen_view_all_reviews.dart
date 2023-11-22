import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
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
          ],
        ),
      ),
    );
  }
}
// class ReviewCommentTile extends StatelessWidget {
//   const ReviewCommentTile(
//       {super.key, required this.review, required this.rating});
//   final String review;
//   final String rating;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 5, bottom: 5),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.black, width: 1)),
//       child: ListTile(
//         trailing: Container(
//             margin: const EdgeInsets.all(2),
//             width: 60,
//             height: 30,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.black.withOpacity(0.5)),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset("assets/svg/star-svgrepo-com.svg",
//                           fit: BoxFit.cover, height: 20, width: 20),
//                       Text(
//                         rating,
//                         style: const TextStyle(color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             )),
//         leading: const CircleAvatar(radius: 20, backgroundColor: Colors.amber),
//         title: Text(
//           review,
//           style: GoogleFonts.poppins(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }