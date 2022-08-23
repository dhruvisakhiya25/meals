import 'package:flutter/material.dart';
import 'package:meals/screens/food.dart';
import 'package:meals/screens/most_popular.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        goodMorning,
                        style:  const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      const Icon(
                        icCart,
                        color: black,
                        size: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(deliveringTo),
                Row(
                  children:  [
                    Text(
                     currentLocation,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: grey,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Icon(icArrowDropDown
                      ,
                      color: orange,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: grey,
                  controller: txtSearch,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      icSearch,
                      color: grey,
                    ),
                    hintText: search,
                    hintStyle: const TextStyle(color: grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:  const BorderSide(color: grey)),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: grey),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 180,
                  child: Food(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      popularRestaurants,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: black),
                    ),
                    Text(
                      viewAll,
                      style: const TextStyle(
                          color: orange,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: populard.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                            populard[index]['image'],
                          ),
                          fit: BoxFit.fitWidth,
                        )),
                      ),
                      Text(
                        populard[index]['title'],
                        style: const TextStyle(
                            color: black, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children:  [
                          const Icon(
                           icStar,
                            color: orange,
                            size: 18,
                          ),
                          Text(rate,
                              style: const TextStyle(color:orange)),
                          Text(
                           ratingCafe,
                            style: const TextStyle(color: black),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                    mostPopularg,
                      style: const TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      viewAll,
                      style: const TextStyle(
                          color: orange,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 240,
                  child: MostPopular(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      resentItem,
                      style: const TextStyle(
                          color: black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      viewAll,
                      style: const TextStyle(
                          color: orange,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                ListView.builder(
                  itemCount: populars.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => SizedBox(
                    height: 100,

                    // color: Colors.green,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(populars[index]['image']),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                populars[index]['title'],
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                               Text(cafeWesternFood),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children:  [
                                  const Icon(
                                    icStar,
                                    color: orange,
                                    size: 15,
                                  ),
                                  Text(
                                    rate,
                                    style: const TextStyle(
                                        color: orange, fontSize: 15),
                                  ),
                                  Text(rating)
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List populard = [
  {
    'image':
        'https://images.unsplash.com/photo-1593246049226-ded77bf90326?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHBpenphfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'title': 'Minute by tuk tuk'
  },
  {
    'image':
        'https://images.unsplash.com/photo-1576866209830-589e1bfbaa4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2QlMjBkZWxpdmVyeXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'title': 'Cafe de noir'
  },
  {
    'image':
        'https://images.unsplash.com/photo-1560643123-9157226100d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJha2VyeSUyMHByb2R1Y3RzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'title': 'Bakes by Tella'
  }
];

List populars = [
  {
    'image':
        'https://media.istockphoto.com/photos/pepperoni-pizza-with-a-slice-taken-out-with-cheese-pull-picture-id1349560406?b=1&k=20&m=1349560406&s=170667a&w=0&h=LGCnsf_hSzZaIU6CXHuB5N7FB0n5uYibXiUN6DqgK-E=',
    'title': 'Mulberry Pizza by josh',
  },
  {
    'image':
        'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29mZmVlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'title': 'Barita',
  },
  {
    'image':
        'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGl6emF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'title': 'Pizza Rush Hour',
  },
];
