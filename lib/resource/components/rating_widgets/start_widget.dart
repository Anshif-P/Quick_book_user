import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/booked_rooms_model.dart';

// ignore: must_be_immutable
class AddStarsWidget extends StatelessWidget {
  AddStarsWidget({
    required this.data,
    required this.ratings,
    Key? key,
    this.bottomTextCheck = true,
  }) : super(key: key);
  final bool bottomTextCheck;
  final BookedRoomModel data;
  ValueNotifier<double> ratings;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: ratings,
            builder: (context, value, child) => RatingBar.builder(
              initialRating: value,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 35,
              itemBuilder: (context, _) => const Icon(
                Icons.star_rate_rounded,
                color: CustomColors.mainColor,
              ),
              onRatingUpdate: (ratings) {
                _handleRatingUpdate(ratings);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleRatingUpdate(double rating) {
    // print(widget.rating.value.toString());
    ratings.value = rating;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    ratings.notifyListeners();
  }
}
