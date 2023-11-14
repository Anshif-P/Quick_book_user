import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmentiesWidget extends StatelessWidget {
  final Map itemsIcon = {
    'Wifi': const Icon(Icons.wifi),
    'Restaurant': const Icon(Icons.hot_tub_outlined),
    'Ac': const Icon(Icons.ac_unit_outlined),
    'Power backup': const Icon(Icons.power),
    'Fitness Center': const Icon(Icons.fitness_center),
    'Tv': const Icon(Icons.tv_rounded),
    'Swimming Pool': const Icon(Icons.pool),
    'Meeting Room': const Icon(Icons.meeting_room_outlined),
    'Elevator': const Icon(Icons.elevator_outlined)
  };
  final List? itemsName;
  AmentiesWidget({super.key, required this.itemsName});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 10, childAspectRatio: 1.3),
      itemCount: itemsName!.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            itemsIcon[itemsName![index]],
            Text(
              itemsName![index],
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              )),
            ),
          ],
        );
      },
    );
  }
}
