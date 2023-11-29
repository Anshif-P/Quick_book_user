import 'dart:core';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../const/custom_colors.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({Key? key, required this.amentiesList}) : super(key: key);
  final ValueNotifier<List<bool>> amentiesList;

  final List<String> items = ['Ac', 'Swimming Pool', 'Meeting Room', 'Wifi'];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4,
      ),
      itemCount: amentiesList.value.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: 22,
              child: ValueListenableBuilder(
                valueListenable: amentiesList,
                builder: (context, value, child) => Checkbox(
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  value: amentiesList.value[index],
                  onChanged: (value) {
                    amentiesList.value[index] = value!;
                    amentiesList.notifyListeners();
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            SizedBox(
              child: Text(
                items[index],
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
