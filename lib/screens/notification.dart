import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification,
                      style: const TextStyle(
                          color: black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(icCart),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifications.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: orange),
                        ),
                        title: Text(
                          notifications[index]['title'],
                          style: const TextStyle(
                              color: black, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          notifications[index]['subTitle'],
                          style: const TextStyle(color: grey),
                        ),
                      ),
                      const Divider(
                        color: grey,
                        thickness: 0.3,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List notifications = [
  {'title': 'Your order has been piked up', 'subTitle': 'Now'},
  {'title': 'Your order has been delivered', 'subTitle': '1 h ago'},
  {
    'title': 'Lorem Ipsum dolor slt amet consectetur3 h ago',
    'subTitle': '3 h ago'
  },
  {
    'title': 'Lorem Ipsum dolor slt amet consectetur3 h ago',
    'subTitle': '5 h ago'
  },
  {
    'title': 'Lorem Ipsum dolor slt amet consectetur3 h ago',
    'subTitle': '05 sep 2020'
  },
  {
    'title': 'Lorem Ipsum dolor slt amet consectetur3 h ago',
    'subTitle': '12 Aug 2020'
  },
  {
    'title': 'Lorem Ipsum dolor slt amet consectetur3 h ago',
    'subTitle': '20 Jul 2020'
  },
  {
    'title': 'Lorem Ipsum dolor slt amet consectetur3 h ago',
    'subTitle': '12 jul 2020'
  }
];
