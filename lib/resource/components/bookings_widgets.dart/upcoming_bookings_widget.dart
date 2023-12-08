import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/rooms_bloc/rooms_bloc.dart';
import '../../const/custom_colors.dart';
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
          child: BlocConsumer<RoomsBloc, RoomsState>(
            // listenWhen: (previous, current) => current is RoomActionState,
            listener: (context, state) {
              if (state is CancelBookingErrorState) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
              if (state is CancelBookingSuccessState) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Room Canceled Successfully')));
              }
              // if (state
              //     is CancelBookingLoadingState) {
              //   cancelButtomLoading =
              //       true;
              // }
            },
            // buildWhen: (previous, current) => current is! RoomActionState,
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
                          return const Center(
                            child: Text('No Rooms Found'),
                          );
                        }
                      });
                }
              }
              return const Center(
                child: Text('No Bookings Found'),
              );
            },
          ),
        ),
      ],
    );
  }
}
