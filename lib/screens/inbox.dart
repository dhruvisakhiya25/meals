import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class InBoxPage extends StatefulWidget {
  const InBoxPage({Key? key}) : super(key: key);

  @override
  State<InBoxPage> createState() => _InBoxPageState();
}

class _InBoxPageState extends State<InBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      inbox,
                      style: const TextStyle(
                          color: black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      icCart,
                      color: black,
                    )
                  ],
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    leading: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: orange),
                    ),
                    title: Text(
                      mealMonkeyPromotion,
                      style: const TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(dolor), Text(consectetur)],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(jul),
                        const Icon(
                          icStar,
                          color: orange,
                        )
                      ],
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
