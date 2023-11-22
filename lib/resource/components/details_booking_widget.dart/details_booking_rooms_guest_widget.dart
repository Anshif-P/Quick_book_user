import 'package:flutter/material.dart';

import '../bookings_widgets.dart/checkin_text_widget.dart';

class CheckinDayTotalRoomInfoWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;

  final String days;
  final String adult;
  final String totalRoom;
  final String roomType;

  const CheckinDayTotalRoomInfoWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.adult,
      required this.days,
      required this.roomType,
      required this.totalRoom});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            // color: Colors.blue,
            height: heightMedia * 0.08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookingDetailsTextWidget(text: 'Days : $days'),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
                BookingDetailsTextWidget(text: 'Adult : $adult'),
              ],
            ),
          ),
        ),
        Container(
          width: 1,
          height: heightMedia * 0.056,
          color: const Color(0xFFD1D1D1),
        ),
        Expanded(
          child: SizedBox(
            //   color: Colors.red,
            height: heightMedia * 0.08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BookingDetailsTextWidget(text: 'Total Room : $totalRoom'),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
                BookingDetailsTextWidget(text: 'Room Type : $roomType'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
