// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../resource/const/text_styles.dart';
import '../resource/string/terms_and_condition_strings.dart';

class ScreenTermsAndCondition extends StatelessWidget {
  const ScreenTermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        centerTitle: true,
        title: const Text(
          'Terms And Condition',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(AppTerms.termsAndCondition, style: AppText.smallDark),
          Divider(color: Colors.grey, thickness: 1, height: 26),
          SizedBox(height: 15),
          terms('Acceptance of Terms', AppTerms.acceptenceOfTerms),
          terms('Use of Services', AppTerms.useOfService),
          terms('User Accounts', AppTerms.userAccounts),
          terms('Booking and Payments', AppTerms.bookingAndPayment),
          terms('Limitation of Liability', AppTerms.limitationOfLiability),
          terms('Changes to Terms', AppTerms.changesToTerms),
          Divider(thickness: 1, height: 30, color: Colors.grey),
          Text('Thank you for using QuickBook',
              style: AppText.darkTerms, textAlign: TextAlign.center),
          Divider(thickness: 1, height: 30, color: Colors.grey),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Column terms(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppText.darkTerms),
        SizedBox(height: 4),
        Text(description, style: AppText.smallDark),
        SizedBox(height: 10)
      ],
    );
  }
}
