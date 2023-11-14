import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';

class SearchTextFeildWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchTextFeildWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: CustomColors.searchTextFeildColor,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
            hintText: 'Search Hotels',
            hintStyle: TextStyle(color: CustomColors.hintTextColor),
            contentPadding: EdgeInsets.only(top: 15),
            //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
            border: InputBorder.none),
      ),
    );
  }
}
