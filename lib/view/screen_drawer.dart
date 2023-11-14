import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_bloc/user_bloc.dart';
import '../const/custom_colors.dart';
import '../resource/components/comman/show_dialog.dart';

class ScreenDrawer extends StatelessWidget {
  ScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 170,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 25),
                Container(
                  width: 60,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                const SizedBox(width: 14),
                BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  if (state is UserDataFetchSuccessState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          state.userDetails.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 14),
                        ),
                        Text(
                          state.userDetails.email,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color(0xFFB5B5B5),
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    );
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('App info'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock),
          title: const Text('Privacy & policy'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.question_mark),
          title: const Text('Help'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.card_membership),
          title: const Text('Add Coupons'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: CustomColors.mainColor,
          ),
          title: Text(
            'Sign Out',
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
        ), // ... Other list tiles ...
      ],
    );
  }
}
