import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../const/custom_colors.dart';
import 'card_widget.dart';

class HistoryBookingsWidget extends StatelessWidget {
  final double heightMedia;
  final double widthMedia;
  const HistoryBookingsWidget(
      {super.key, required this.heightMedia, required this.widthMedia});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 1,
          color: CustomColors.lightGreyColor,
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BookingCardWidget(
                  heightMedia: heightMedia,
                  widthMedia: widthMedia,
                  text: '',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
