// ignore_for_file: use_build_context_synchronously, file_names

import 'package:meals/screens/meal_monkey.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/responsive.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen();
  }

  Future<void> splashScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MealMonkey(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SizedBox(
          width: Screens.width(context) * 1,
          height: Screens.height(context) * 1,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/splashIcon.png'),
                        fit: BoxFit.fill)),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/image/MealMonkeyLogo.png')),
            ],
          ),
        ));
  }
}
