import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/responsive.dart';
import 'package:meals/utils/strings.dart';

class Bevagers extends StatefulWidget {
  const Bevagers({Key? key}) : super(key: key);

  @override
  State<Bevagers> createState() => _BevagersState();
}

class _BevagersState extends State<Bevagers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bevagers,
                      style: const TextStyle(color: black, fontSize: 30),
                    ),
                    const Icon(
                      icCart,
                      color: black,
                    ),
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Item(),
                            ));
                      }
                    },
                    child: Container(
                      height: 300,
                      width: 100,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(menuList[index]['img']),
                            fit: BoxFit.cover),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: ListTile(
                        title: Text(menuList[index]['itemName'],style: const TextStyle(color: white),),
                        subtitle: Row(
                          children: [
                            const Icon(
                              icStar,
                              color: orange,
                            ),
                            Text(
                              menuList[index]['rate'],
                              style: const TextStyle(color: orange),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 5,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> menuList = [
  {
    'img':
        'https://images.unsplash.com/photo-1619213538819-7628fe20dacf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGFwcGxlJTIwcGllfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60',
    'itemName': 'Apple pie',
    'rate': '4.7',
  },
  {
    'img':
        'https://images.unsplash.com/photo-1484300681262-5cca666b0954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhcmslMjBjaG9jb2xhdGUlMjBjYWtlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'itemName': 'Dark chocolate cake',
    'rate': '4.9',
  },
  {
    'img':
        'https://images.unsplash.com/photo-1578905896074-d2f0ecde5aed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyZWV0JTIwc2hha2V8ZW58MHx8MHx8&auto=format&fit=crop&w=400&q=60',
    'itemName': 'Street Shake',
    'rate': '4.9',
  },
  {
    'img':
        'https://images.unsplash.com/photo-1607920591413-4ec007e70023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZnVkZ3klMjBicm93bmllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60',
    'itemName': 'Fudgy Brownies',
    'rate': '4.9',
  },
];

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: Screens.height(context) * 0.5,
              width: Screens.width(context),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1484300681262-5cca666b0954?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGRhcmslMjBjaG9jb2xhdGUlMjBjYWtlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: Screens.height(context) * 0.7,
              width: Screens.width(context),
              margin: EdgeInsets.only(top: Screens.height(context) * 0.43),
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      darkChocolateCake,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                      child: _star(context),
                    ),
                    Text(starRating),
                    Text(description),
                    Text(loremIpsum),
                    const Divider(thickness: 2),
                    Row(
                      children: [
                        Text(numberOfPortion),
                        const SizedBox(
                          width: 20,
                        ),
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          color: orange,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          onPressed: () {},
                          child: const Icon(icRemove),
                        ),
                        const Text(
                          '3',
                          style: TextStyle(fontSize: 30),
                        ),
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          color: orange,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          onPressed: () {},
                          child: const Icon(icAdd),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 200,
                          margin: const EdgeInsets.only(top: 40, left: 50),
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 0,
                              ),
                              Column(
                                children: [
                                  Text(totalPrice),
                                  Text(lkr),
                                  MaterialButton(
                                    onPressed: () {},
                                    color: orange,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                            const BorderSide(color: orange)),
                                    child: Text(
                                      addToCart,
                                      style: const TextStyle(color: white),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(icCart)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_star(BuildContext context) {
  return ListView.builder(
    // shrinkWrap: true,
    itemCount: 5,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => index == 4
        ? const Icon(
            icStarHalf,
            color: orange,
          )
        : const Icon(
            icStar,
            color: orange,
          ),
  );
}
