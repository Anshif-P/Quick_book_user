import 'dart:core';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({Key? key, required this.filterList}) : super(key: key);
  final ValueNotifier<List<String>> filterList;

  final List<String> items = [
    'Ac',
    'Swimming Pool',
    'Meeting Room',
    'Wifi',
    'Restaurant',
    'Power backup',
    'Fitness Center',
    'Tv',
    'Elevatorv'
  ];
  // 'Wifi': const Icon(Icons.wifi),
  //   'Restaurant': const Icon(Icons.hot_tub_outlined),
  //   'Ac': const Icon(Icons.ac_unit_outlined),
  //   'Power backup': const Icon(Icons.power),
  //   'Fitness Center': const Icon(Icons.fitness_center),
  //   'Tv': const Icon(Icons.tv_rounded),
  //   'Swimming Pool': const Icon(Icons.pool),
  //   'Meeting Room': const Icon(Icons.meeting_room_outlined),
  //   'Elevator': const Icon(Icons.elevator_outlined)
  // final filterList = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(
              width: 22,
              child: ValueListenableBuilder(
                valueListenable: filterList,
                builder: (context, value, child) => Checkbox(
                  overlayColor:
                      WidgetStateColor.resolveWith((states) => Colors.white),
                  fillColor:
                      WidgetStateColor.resolveWith((states) => Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  value: filterList.value.contains(items[index]),
                  onChanged: (value) {
                    if (value!) {
                      filterList.value.add(items[index]);
                    } else {
                      filterList.value.remove(items[index]);
                    }

                    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                    filterList.notifyListeners();
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
