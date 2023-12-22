// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../const/custom_colors.dart';
import 'text_cusomerinfo.dart';

class CustomerInformationWidget extends StatelessWidget {
  const CustomerInformationWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.address,
      required this.mobNo,
      required this.name});
  final double heightMedia;
  final double widthMedia;
  final String name;
  final String mobNo;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: heightMedia * 0.22,
      alignment: Alignment.topCenter,
      color: CustomColors.extraLightGrey,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          height: heightMedia * 0.17,
          width: widthMedia * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightMedia * 0.02,
                ),
                CusomerInfoTextWidget(text1: 'Name        :', text2: '  $name'),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
                InkWell(
                  onTap: () {
                    _launchCall(mobNo);
                  },
                  child: CusomerInfoTextWidget(
                    text1: 'Mobile No :',
                    text2: '  $mobNo',
                    colorCheck: true,
                  ),
                ),
                SizedBox(
                  height: heightMedia * 0.015,
                ),
                CusomerInfoTextWidget(
                    text1: 'Address     :', text2: '  $address'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
