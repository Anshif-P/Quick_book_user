// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import '../resource/const/text_styles.dart';
import '../resource/string/help.dart';

class ScreenHelp extends StatelessWidget {
  const ScreenHelp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Help Center',
            style: TextStyle(color: Colors.black),
          )),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('Frequently Asked Questions (FAQs)', style: AppText.dark),
          SizedBox(height: 20),
          help('How do I search for hotels ?', AppHelp.howISearchHotel),
          help('How do I make a booking ?', AppHelp.howDoIMakeBookings),
          help('Can I cancel a booking ?', AppHelp.canICancelABookings),
          help('What payment methods are accepted ?', AppHelp.paymentMethods),
          SizedBox(height: 10),
          Text('App Features', style: AppText.dark),
          SizedBox(height: 20),
          help('Map and Location Services', AppHelp.mapAndLocationServices),
          help('Account Management', AppHelp.accountManagement),
          SizedBox(height: 10),
          Text('Technical Support', style: AppText.dark),
          SizedBox(height: 20),
          help('Troubleshooting', AppHelp.troubleshoot),
          help('App Compatibility', AppHelp.appCompatibility),
          Divider(height: 30, thickness: 1, color: Colors.grey),
          Text('Thank you for choosing QuickBook for your travel needs',
              style: AppText.mediumdark, textAlign: TextAlign.center),
          Divider(height: 30, thickness: 1, color: Colors.grey)
        ],
      ),
    );
  }

  Column help(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppText.mediumdark.copyWith(color: CustomColors.blackColor)),
        SizedBox(height: 8),
        Text(description, style: AppText.smallDark),
        SizedBox(height: 15)
      ],
    );
  }
}
