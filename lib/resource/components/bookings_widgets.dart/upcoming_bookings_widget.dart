import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/rooms_bloc/rooms_bloc.dart';
import '../../../const/custom_colors.dart';
import 'card_widget.dart';

class UpcomingBookingsWidget extends StatelessWidget {
  final double heightMedia;
  final double widthMedia;
  const UpcomingBookingsWidget(
      {super.key, required this.heightMedia, required this.widthMedia});

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
                final upcomingRooms = state.roomList
                    .where((data) =>
                        data.checkIn.isAfter(date) && data.isCancel == false)
                    .toList();
                if (upcomingRooms.isNotEmpty) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: upcomingRooms.length,
                      itemBuilder: (context, index) {
                        if (upcomingRooms.isNotEmpty) {
                          print(
                              'upcoming rooms ------------------------------------------ rooms');
                          print(upcomingRooms.length);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: BookingCardWidget(
                              data: upcomingRooms[index],
                              checkedOutOrUpcomingCheck: false,
                              heightMedia: heightMedia,
                              widthMedia: widthMedia,
                            ),
                          );
                        } else {
                          return Center(
                            child: Text('No Rooms Found'),
                          );
                        }
                      });
                }
              }
              return Center(
                child: Text('No Bookings Found'),
              );
            },
          ),
        ),
      ],
    );
  }
}
