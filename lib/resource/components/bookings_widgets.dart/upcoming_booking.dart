import 'package:flutter/widgets.dart';
import '../../../const/custom_colors.dart';
import 'card_widget.dart';

class UpcomingBookingsWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  const UpcomingBookingsWidget(
      {super.key, required this.widthMedia, required this.heightMedia});

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
            )
          ],
        ))
      ],
    );
  }
}
