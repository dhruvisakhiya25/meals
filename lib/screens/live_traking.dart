import 'package:flutter/material.dart';
import 'package:meals/screens/mainPage.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/strings.dart';


class LiveTrackingPage extends StatefulWidget {
  const LiveTrackingPage({Key? key}) : super(key: key);

  @override
  State<LiveTrackingPage> createState() => _LiveTrackingPageState();
}

class _LiveTrackingPageState extends State<LiveTrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:  SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: grey,
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: grey,
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: orange,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
           liveTraking,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: black),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(realTimeTraking),
           Text(onceYouPlaced),
          const SizedBox(
            height: 60,
          ),
          MaterialButton(
            height: 55,
            minWidth: 300,
            color: orange,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:  const BorderSide(color: orange),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const MainPage(),
                  ));
              setState(
                    () {},
              );
            },
            child:  Text(
              next,
              style: const TextStyle(color: white, fontSize: 20),
            ),
          ),
        ],
      ),
    ),);
  }
}
