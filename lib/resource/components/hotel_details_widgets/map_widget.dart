import 'package:flutter/material.dart';

import '../../../const/custom_colors.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

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
        ),
      ],
    );
  }
}
