import 'package:flutter/material.dart';

import '../../const/custom_colors.dart';
import '../../../view/screen_map.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.latitude, required this.longitude});
  final double longitude;
  final double latitude;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 38,
        ),
        Container(
          height: 160,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: CustomColors.lightGreyColor,
              borderRadius: BorderRadius.circular(7)),
          child: ScreenMap(
            latitude: latitude,
            longitude: longitude,
          ),
        ),
      ],
    );
  }
}
