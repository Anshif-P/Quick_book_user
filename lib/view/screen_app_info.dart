import 'package:flutter/material.dart';

import '../resource/const/text_styles.dart';
import '../resource/string/app_info.dart';

class ScreenAppInfo extends StatelessWidget {
  const ScreenAppInfo({super.key});

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
          'App Info',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('About East Stay',
              style:
                  AppText.xLarge.copyWith(fontSize: 20, color: Colors.black)),
          const SizedBox(height: 10),
          Text(AppInfo.about, style: AppText.smallDark.copyWith(fontSize: 13)),
          const SizedBox(height: 20),
          Text('Our Mission:', style: AppText.largeDark),
          const SizedBox(height: 8),
          Text(AppInfo.ourMission, style: AppText.smallDark),
          const SizedBox(height: 20),
          Text('Key Features:', style: AppText.largeDark),
          const SizedBox(height: 8),
          features('Search and Book:', AppInfo.searchAndBook),
          const SizedBox(height: 8),
          features('User-Friendly Interface:', AppInfo.uI),
          const SizedBox(height: 8),
          features('Secure Payments:', AppInfo.payment),
          const SizedBox(height: 20),
          Text('Why EastStay', style: AppText.largeDark),
          const SizedBox(height: 8),
          features('Free to Use:', AppInfo.freeToUser),
          const SizedBox(height: 8),
          features('Flutter-Powered:', AppInfo.flutter),
        ],
      ),
    );
  }

  Text features(String title, String subtitle) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: title,
          style: AppText.mediumdark.copyWith(
              fontSize: 13, color: const Color.fromARGB(255, 70, 70, 70))),
      TextSpan(text: subtitle, style: AppText.smallDark)
    ]));
  }
}
