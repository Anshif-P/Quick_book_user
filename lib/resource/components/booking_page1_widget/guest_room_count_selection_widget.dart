import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

class RoomGuestCountSelection extends StatelessWidget {
  const RoomGuestCountSelection(
      {super.key,
      required this.text,
      required this.icon,
      required this.data,
      required this.guestOrRoomCheck,
      required this.notifier});
  final String text;
  final IconData icon;
  final ValueNotifier<int> notifier;
  final RoomsModel data;
  final int count = 1;
  final bool guestOrRoomCheck;

  @override
  Widget build(BuildContext context) {
    final int capacity = int.parse(data.capacity);
    final int totalRooms = int.parse(data.totalRooms);
    capacity - 1;
    totalRooms - 1;

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
              child: Row(children: [
            Icon(icon),
            const SizedBox(
              width: 5,
            ),
            CustomTextWidget(
                text: text,
                color: CustomColors.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.normal)
          ])),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    if (value >= 2) {
                      notifier.value--;
                    }
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: CustomColors.lightGreyColor, width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        Icons.remove,
                        size: 18,
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      //  color: Colors.green,
                      border: Border.all(
                          color: CustomColors.lightGreyColor, width: 1),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(value.toString()),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    if (guestOrRoomCheck && value < capacity) {
                      notifier.value++;
                    } else if (guestOrRoomCheck == false &&
                        value < totalRooms) {
                      notifier.value++;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Limit exceeded'),
                        backgroundColor: CustomColors.mainColor,
                      ));
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: CustomColors.lightGreyColor, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: const Icon(
                      Icons.add,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
