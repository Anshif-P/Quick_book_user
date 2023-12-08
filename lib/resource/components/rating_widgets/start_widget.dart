import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/booked_rooms_model.dart';

class AddStarsWidget extends StatefulWidget {
  const AddStarsWidget({
    required this.data,
    required this.rating,
    Key? key,
    this.bottomTextCheck = true,
  }) : super(key: key);
  final bool bottomTextCheck;
  final BookedRoomModel data;
  final ValueNotifier<double> rating;

  @override
  // ignore: library_private_types_in_public_api
  _AddStarsWidgetState createState() => _AddStarsWidgetState();
}

class _AddStarsWidgetState extends State<AddStarsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: widget.rating,
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
              onRatingUpdate: (rating) {
                _handleRatingUpdate(rating);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleRatingUpdate(double rating) {
    // print(widget.rating.value.toString());
    widget.rating.value = rating;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    widget.rating.notifyListeners();
  }
}
