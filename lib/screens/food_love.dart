import 'package:flutter/material.dart';
import 'package:meals/screens/fast_delivery.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/strings.dart';

class FoodLovePage extends StatefulWidget {
  const FoodLovePage({Key? key}) : super(key: key);

  @override
  State<FoodLovePage> createState() => _FoodLovePageState();
}

class _FoodLovePageState extends State<FoodLovePage> {
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
                    color: orange,
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
                    color: grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              findFood,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 35, color: black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(discoverFood),
            Text(restaurantsFast),
            Text(doorStep),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 55,
              minWidth: 300,
              color: orange,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: orange),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FastDeliveryPage(),
                  ),
                );
                setState(
                  () {},
                );
              },
              child: Text(
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
