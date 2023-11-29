// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/view/screen_bookings.dart';
import 'package:hotel_booking_user_app/view/screen_home.dart';
import 'package:hotel_booking_user_app/view/screen_profile.dart';
import 'package:hotel_booking_user_app/view/screen_rooms.dart';
import '../resource/const/custom_colors.dart';

class ScreenParentNavigation extends StatelessWidget {
  ScreenParentNavigation({super.key});

  final pageNotifier = ValueNotifier(0);

  final List<Widget> _screens = [
    ScreenHome(),
    ScreenBooking(),
    ScreenRooms(),
    ScreenProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: pageNotifier,
          builder: (context, value, _) => _screens[pageNotifier.value]),
      bottomNavigationBar: NavigationBar(pageNotifier: pageNotifier),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key, required this.pageNotifier});
  final ValueNotifier<int> pageNotifier;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: pageNotifier,
        builder: (context, value, _) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(
                        color: CustomColors.extraLightGrey, width: 1))),
            padding: EdgeInsets.only(top: 4),
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                bottomNavigationItems(
                  icon: CupertinoIcons.home,
                  label: 'DashBoard',
                  onTap: () => pageNotifier.value = 0,
                  isSelected: pageNotifier.value == 0,
                ),
                bottomNavigationItems(
                  icon: CupertinoIcons.bag,
                  label: 'Bookings',
                  onTap: () => pageNotifier.value = 1,
                  isSelected: pageNotifier.value == 1,
                ),
                bottomNavigationItems(
                  icon: CupertinoIcons.building_2_fill,
                  label: 'Rooms',
                  onTap: () => pageNotifier.value = 2,
                  isSelected: pageNotifier.value == 2,
                ),
                bottomNavigationItems(
                    icon: CupertinoIcons.person,
                    label: 'Profile',
                    onTap: () => pageNotifier.value = 3,
                    isSelected: pageNotifier.value == 3),
              ],
            ),
          );
        });
  }

  Expanded bottomNavigationItems({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    bool addTextcolor = false,
    bool hideIcon = false,
    bool isSelected = false,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: 5),
              hideIcon
                  ? SizedBox(height: 25)
                  : Icon(
                      icon,
                      color: isSelected ? Colors.black : Colors.grey.shade500,
                    ),
              SizedBox(height: 5),
              Text(
                label,
                style: GoogleFonts.inter(
                    color: addTextcolor == false
                        ? isSelected
                            ? Colors.black
                            : Colors.grey.shade500
                        : CustomColors.mainColor,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
