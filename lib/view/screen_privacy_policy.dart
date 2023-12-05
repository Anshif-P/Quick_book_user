import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';

import '../resource/const/text_styles.dart';
import '../resource/string/privacy_policy.dart';

class ScreenPrivacyPolicy extends StatelessWidget {
  const ScreenPrivacyPolicy({super.key});

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
          'Privacy & Policy',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Privacy Policy for QuickBook',
              style: AppText.xLarge.copyWith(color: Colors.black)),
          const SizedBox(height: 8),
          Text(AppPrivacy.privacy, style: AppText.smallDark),
          const SizedBox(height: 20),
          Text('Information we collect',
              style:
                  AppText.largeDark.copyWith(color: CustomColors.blackColor)),
          const SizedBox(height: 15),
          info('Personal Information :', AppPrivacy.personalInf),
          info('Booking Information :', AppPrivacy.bookingInfo),
          const SizedBox(height: 15),
          Text('How We Use Your Information',
              style:
                  AppText.largeDark.copyWith(color: CustomColors.blackColor)),
          const SizedBox(height: 15),
          info('Provide Services:', AppPrivacy.provideService),
          info('Improve User Experience :', AppPrivacy.improveUserExperience),
          info('Communications:', AppPrivacy.communications),
          const SizedBox(height: 15),
          Text('Information Sharing',
              style:
                  AppText.largeDark.copyWith(color: CustomColors.blackColor)),
          const SizedBox(height: 15),
          info('Service Providers:', AppPrivacy.serviceProviders),
          info('Legal Compliance', AppPrivacy.legalCompliance),
          const SizedBox(height: 15),
          Text('Security Measures :',
              style:
                  AppText.largeDark.copyWith(color: CustomColors.blackColor)),
          const SizedBox(height: 8),
          Text(AppPrivacy.securityMeasurements, style: AppText.smallDark),
          const SizedBox(height: 15),
          Text('Updates to This Privacy Policy :', style: AppText.largeDark),
          const SizedBox(height: 8),
          Text(AppPrivacy.updates, style: AppText.smallDark),
          const SizedBox(height: 15),
          const Divider(color: Colors.grey, height: 20, thickness: 1),
          const SizedBox(height: 15),
          Text(AppPrivacy.thanks, style: AppText.xSmall),
          const SizedBox(height: 15),
          const Divider(color: Colors.grey, height: 20, thickness: 1),
          const SizedBox(height: 15)
        ],
      ),
    );
  }

  Column info(String title, String description) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: AppText.mediumdark.copyWith(color: CustomColors.blackColor)),
      const SizedBox(height: 4),
      Text(description, style: AppText.smallDark),
      const SizedBox(height: 12)
    ]);
  }
}
