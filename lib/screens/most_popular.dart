import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({Key? key}) : super(key: key);

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      //  physics: NeverScrollableScrollPhysics(),
      itemCount: mostPopular.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            height: 130,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(
                    mostPopular[index]['image'],
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mostPopular[index]['text'],
                  style: const TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Row(
                  children:  [
                    Text(cafeWesternFood),
                    const Icon(
                      icSearch,
                      color: orange,
                      size: 15,
                    ),
                    Text(
                      rate,
                      style: const TextStyle(color: orange),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List mostPopular = [
  {
    'image':
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'text': ''
  },
  {
    'image':
        'https://media.istockphoto.com/photos/closeup-of-a-veggie-burger-with-copy-space-picture-id1331109186?b=1&k=20&m=1331109186&s=170667a&w=0&h=CWqc2DNV-frmE_aqiQu4Q-SfCUmqJIp362drb4cSMZU=',
    'text': 'Burger by Bambaa'
  },
  {
    'image':
        'https://images.unsplash.com/photo-1547558840-8ad6c8e662a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMGl0ZW1zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'text': 'Barista'
  },
  {
    'image':
        'https://images.unsplash.com/photo-1576521529275-f0f0d02a93b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Zm9vZCUyMGl0ZW1zfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'text': 'Cafe De Noires'
  },
];
