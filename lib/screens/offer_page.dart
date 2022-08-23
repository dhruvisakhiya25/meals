import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [    Text(
                      latestOffers,
                      style: const TextStyle(
                          color: black, fontWeight: FontWeight.bold,fontSize: 25 ),
                    ),


                      const Icon(
                        icCart,
                        color: black,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(findDiscount),
                   Text(mealsAndMore),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    height: 30,
                    minWidth: 150,
                    color: orange,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: orange)),
                    onPressed: () {},
                    child:  Text(
                      checkOffer,
                      style: const TextStyle(color: white),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: latestOffer.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: 360,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    latestOffer[index]['image'],
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Text(
                          latestOffer[index]['title'],
                          style: const TextStyle(
                              color: black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children:  [
                            const Icon(
                              icStar,
                              color: orange,
                            ),
                            Text(
                              rate,
                              style: const TextStyle(color: orange),
                            ),
                            Text(
                              ratingCafe,
                              style: const TextStyle(color: grey),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List latestOffer = [
  {
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE3rEwEDqyTsWVD23-Db0ROzWbaBXG90zREw&usqp=CAU',
    'title': 'Cafe de Noires',
  },
  {
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNtdKuRD_nZLAVhvLkBoJ6NYXRncZj6LRAzA&usqp=CAU',
    'title': 'Isso',
  },
  {
    'image':
        'https://images.unsplash.com/photo-1507133750040-4a8f57021571?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwyMjkwMjM5fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'title': 'Cafe Beans'
  }
];
