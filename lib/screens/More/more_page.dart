// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals/Network/authController.dart';
import 'package:meals/screens/shared_pref/shared_pref.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    final authController=Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      mores,
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  Icon(
                    icCart,
                    color: black,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: more.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  height: 70,
                  width: 400,
                  color: white,
                  margin: const EdgeInsets.all(5),
                  child: ListTile(
                    onTap: () async {
                      if (index == 0) {
                        Get.toNamed('/paymentDetails');
                      }
                      if (index == 1) {
                        Get.toNamed('/myOrderPage');
                      }
                      if (index == 2) {
                        Get.toNamed('/notificationPage');
                      }
                      if (index == 3) {
                        Get.toNamed('/inBoxPage');
                      }
                      if (index == 4) {
                        Get.toNamed('/aboutUsPage');
                      }
                      if (index == 5) {
                        await authController.signOut();
                        setState(() {});
                        Get.offAllNamed('/loginPage');
                        SharedPref.setFbLoginName = '';
                        SharedPref.setFbLoginEmail = '';
                        SharedPref.setProfileImage = '';
                      }
                    },
                    leading: CircleAvatar(
                      backgroundColor: black,
                      child: Icon(
                        more[index]['circleAvatar'],
                        color: white,
                      ),
                    ),
                    title: Text(
                      more[index]['title'],
                    ),
                    trailing: const Icon(
                      icRightArrow,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List more = [
  {
    'circleAvatar': icPaid,
    'title': paymentDetails,
  },
  {
    'circleAvatar': icWork,
    'title': myOrder,
  },
  {
    'circleAvatar': icNotification,
    'title': notification,
  },
  {
    'circleAvatar': icMail,
    'title': inbox,
  },
  {
    'circleAvatar': icAbout,
    'title': aboutUs,
  },
  {'circleAvatar': icLogOut, 'title': logOut}
];
