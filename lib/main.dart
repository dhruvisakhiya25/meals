import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meals/screens/Bottam_Navigation/mainPage.dart';
import 'package:meals/screens/Menu/bevagers.dart';
import 'package:meals/screens/Menu/food.dart';
import 'package:meals/screens/Menu/promotion.dart';
import 'package:meals/screens/More/about_us.dart';
import 'package:meals/screens/More/my_order/checkout.dart';
import 'package:meals/screens/More/payment_details.dart';

import 'package:meals/screens/Splash/meal_monkey.dart';
import 'package:meals/screens/Splash/splashScreen.dart';
import 'package:meals/screens/login/login.dart';
import 'package:meals/screens/menu/desserts.dart';
import 'package:meals/screens/more/inbox.dart';
import 'package:meals/screens/more/my_order/my_order.dart';
import 'package:meals/screens/more/notification.dart';

import 'package:meals/screens/shared_pref/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBhFUxeDB6O5ki3R3IoAPDPEcZWjCsGR78",
            appId: "1:358514215620:ios:fd45c3c61c94a0fa629791",
            messagingSenderId: "358514215620",
            projectId: "meals-f852f"));
  } else {
    await Firebase.initializeApp();
  }
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialRoute: '/',
      // defaultTransition: Transition.circularReveal,
      getPages: [
        GetPage(
          name: '/mealsHome',
          page: () {
            if (SharedPref.getFbLoginName != '' &&
                SharedPref.getFbLoginName != null &&
                SharedPref.getFbLoginEmail != '' &&
                SharedPref.getFbLoginEmail != null) {
              return const MainPage();
            } else if (SharedPref.getGoogleName != '' &&
                SharedPref.getGoogleName != null) {
              return const MainPage();
            } else {
              return const MealMonkey();
            }
          },
        ),
        GetPage(
          name: '/item',
          page: () => const Item(),
        ),
        GetPage(
          name: '/foods',
          page: () => const Foods(),
        ),
        GetPage(
          name: '/bevagers',
          page: () => const Bevagers(),
        ),
        GetPage(
          name: '/desserts',
          page: () => const Desserts(),
        ),
        GetPage(
          name: '/promotions',
          page: () => const Promotions(),
        ),
        GetPage(
          name: '/paymentDetails',
          page: () => const PaymentDetails(),
        ),
        GetPage(
          name: '/myOrderPage',
          page: () => const MyOrderPage(),
        ),
        GetPage(
          name: '/notificationPage',
          page: () => const NotificationPage(),
        ),
        GetPage(
          name: '/inBoxPage',
          page: () => const InBoxPage(),
        ),
        GetPage(
          name: '/aboutUsPage',
          page: () => const AboutUsPage(),
        ),
        GetPage(
          name: '/loginPage',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/checkOutPage',
          page: () => const CheckOutPage(),
        ),
      ],
    );
  }
}
