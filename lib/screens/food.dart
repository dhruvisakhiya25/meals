import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shrinkWrap: true,
      //  physics: NeverScrollableScrollPhysics(),
      itemCount: food.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(
                    food[index]['image'],
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Text(
            food[index]['text'],
            style: const TextStyle(
                color: black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

List food = [
  {
    'image':
    'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'text': 'Offers'
  },
  {
    'image':
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7WSnmcvjLTVCUCRI1f4nFzBnHTsV9q81bZw&usqp=CAU',
    'text': 'Sri Lankan'
  },
  {
    'image':
    'https://images.unsplash.com/photo-1498579150354-977475b7ea0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXRhbGlhbiUyMGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'text': 'Italian'
  },
  {
    'image':
    'https://images.unsplash.com/photo-1585937421612-70a008356fbe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwZm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'text': 'Indian'
  },
  {
    'image':
    'https://media.istockphoto.com/photos/rajma-chawal-an-indian-food-picture-id1309964339?b=1&k=20&m=1309964339&s=170667a&w=0&h=tNTwsoo0CiBlgSlxugX3-kI2Api-jhk0DJVY5U5N2Gc=',
    'text': 'Punjabi'
  },
  {
    'image':
    'https://media.istockphoto.com/photos/stir-fried-marinated-tofu-picture-id1305943018?b=1&k=20&m=1305943018&s=170667a&w=0&h=yp2WImBdL5OU0p-yF5Rxsh_G-vtfaQyd474AOc6IGws=',
    'text': 'chines'
  },
  {
    'image':
    'https://media.istockphoto.com/photos/curd-samosa-chaat-picture-id1398144457?b=1&k=20&m=1398144457&s=170667a&w=0&h=jnSblHMQ96HH-S51qM9f85VfOp234UYGX-IZu25uHUU=',
    'text': 'South'
  },
  {
    'image':
    'https://media.istockphoto.com/photos/gujarati-traditional-street-food-sev-khaman-dhokla-picture-id1407704326?b=1&k=20&m=1407704326&s=170667a&w=0&h=niX15qhxqVGkBbxRYTCld3UusXZrqNAcU9MQF47s0p0=',
    'text': 'Gujarati'
  }
];