import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/rooms_bloc/rooms_bloc.dart';
import '../../../const/custom_colors.dart';

import 'card_widget.dart';

class CheckedOutWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final BuildContext homeContext;
  const CheckedOutWidget(
      {super.key,
      required this.homeContext,
      required this.widthMedia,
      required this.heightMedia});

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
            child: BlocBuilder<RoomsBloc, RoomsState>(
          buildWhen: (previous, current) => current is! RoomActionState,
          builder: (context, state) {
            if (state is FetchBookedRoomsSuccessState) {
              final date = DateTime.now();
              final checkedOutRooms = state.roomList
                  .where((data) =>
                      data.checkOut.isBefore(date) && data.isCancel == false)
                  .toList();
              if (checkedOutRooms.isNotEmpty) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: checkedOutRooms.length,
                  itemBuilder: (context, index) {
                    if (checkedOutRooms.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: BookingCardWidget(
                          homeContext: homeContext,
                          data: checkedOutRooms[index],
                          checkedOutOrUpcomingCheck: true,
                          heightMedia: heightMedia,
                          widthMedia: widthMedia,
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("No Bookings Found"),
                      );
                    }
                  },
                );
              }
            }
            return const Center(
              child: Text("No Bookings Found"),
            );
          },
        ))
      ],
    );
  }
}
