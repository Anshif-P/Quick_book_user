import 'package:flutter/material.dart';

import '../../../const/custom_colors.dart';
import '../comman/show_dialog.dart';

// ignore: must_be_immutable
class ProfileListTileWidget extends StatelessWidget {
  ProfileListTileWidget({super.key});

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
