import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/view/screen_rooms.dart';
import '../../const/custom_colors.dart';
import '../comman/show_dialog.dart';

// ignore: must_be_immutable
class ProfileListTileWidget extends StatelessWidget {
  List<RoomsModel>? data;
  ProfileListTileWidget({super.key, required this.data});
  List<RoomsModel>? wishList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Security'),
          leading: const Icon(Icons.security, color: Colors.black),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: CustomColors.lightGreyColor,
          ),
          onTap: () {},
        ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
        ListTile(
          leading: const Icon(Icons.help_outline_outlined, color: Colors.black),
          title: const Text('Help'),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: CustomColors.lightGreyColor,
          ),
          onTap: () {},
        ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
        Container(
          height: 10,
          color: CustomColors.extraLightGrey,
        ),
        ListTile(
          leading: const Icon(
            Icons.lock_open_outlined,
            color: Colors.black,
          ),
          title: const Text('Change Password'),
          trailing: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: CustomColors.lightGreyColor,
          ),
          onTap: () {},
        ),
        BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (state is FetchWishlistSuccessState) {
            wishList = data!
                .where((element) => state.wishlist.any((wishlistElement) =>
                    wishlistElement.roomId.id == element.id))
                .toList();
            return ListTile(
              leading: const Icon(
                Icons.favorite_border_rounded,
                color: Colors.black,
              ),
              title: const Text('Wishlist'),
              trailing: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: CustomColors.lightGreyColor,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenRooms(
                          allRoomsOrCategorizedRoomCheck: true,
                          categorizedRooms: wishList,
                          headingCheckForWishlist: true,
                        )));
              },
            );
          }
          return SizedBox();
        }),

        // Divider(
        //   height: 1,
        //   color: CustomColors.lightGreyColor,
        //   thickness: 0.5,
        // ),
        // Obx(
        //   () => SwitchListTile(
        //       secondary: Icon(
        //         Icons.remove_red_eye_outlined,
        //         color: Colors.black,
        //       ),
        //       title: Text('Dark Theme'),
        //       value: isDarkThemeEnabled.value,
        //       onChanged: (value) {
        //         isDarkThemeEnabled.value = value;
        //       }),
        // ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
        ListTile(
          leading: Icon(
            Icons.logout_outlined,
            color: CustomColors.mainColor,
          ),
          title: Text(
            'Logout',
            style: TextStyle(color: CustomColors.mainColor),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return LogoutDialog();
              },
            );
          },
        ),
        Divider(
          height: 1,
          color: CustomColors.lightGreyColor,
          thickness: 0.5,
        ),
      ],
    );
  }
}
