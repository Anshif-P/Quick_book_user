import 'package:flutter/material.dart';

import '../../../const/custom_colors.dart';

class FavoriteWidget extends StatelessWidget {
  FavoriteWidget({super.key});
  bool iconColor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: InkWell(
        onTap: () {},
        child: Icon(
          Icons.favorite_outlined,
          color: CustomColors.grey,
          size: 16,
        ),
      ),
    );
  }
}
