import 'package:flutter/material.dart';
import 'package:meals/screens/live_traking.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/strings.dart';


class FastDeliveryPage extends StatefulWidget {
  const FastDeliveryPage({Key? key}) : super(key: key);

  @override
  State<FastDeliveryPage> createState() => _FastDeliveryPageState();
}

class _FastDeliveryPageState extends State<FastDeliveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    color:orange,
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
              ],
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
             fastDelivery ,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: black),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(fastFood),
             Text(whereEverYou),
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
                      builder: (context) => const LiveTrackingPage(),
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
      ),
    );
  }
}
