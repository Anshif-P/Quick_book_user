import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/booked_rooms_model.dart';

class AddStarsWidget extends StatefulWidget {
  AddStarsWidget({
    required this.data,
    required this.rating,
    Key? key,
    this.bottomTextCheck = true,
  }) : super(key: key);
  final bool bottomTextCheck;
  final BookedRoomModel data;
  final ValueNotifier<double> rating;

  @override
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
              itemBuilder: (context, _) => Icon(
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
    widget.rating.notifyListeners();
    print(widget.rating.value);
  }
}
