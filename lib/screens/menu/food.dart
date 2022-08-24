import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/responsive.dart';
import 'package:meals/utils/strings.dart';

class Foods extends StatefulWidget {
  const Foods({Key? key}) : super(key: key);

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {

  final CollectionReference _products =
  FirebaseFirestore.instance.collection('food');
  late Stream<QuerySnapshot> _streams;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streams = _products.snapshots();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
            Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            foods,
                            style: const TextStyle(color: black, fontSize: 30),
                          ),
                          const Icon(
                            icCart,
                            color: black,
                          ),
                        ],
                      ),
                    ),
                StreamBuilder<QuerySnapshot>(
                  stream: _streams,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    QuerySnapshot querySnapshot = snapshot.data;
                    List<QueryDocumentSnapshot> document = querySnapshot.docs;
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(height: 3,),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: document.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot documents = document[index];
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
                                  image: NetworkImage(documents['image']),
                                  fit: BoxFit.cover),
                            ),
                            alignment: Alignment.bottomLeft,
                            child: ListTile(
                              title: Text(documents['txt'],style: const TextStyle(color: white),),
                              subtitle: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    documents['rate'].toString(),
                                    style: const TextStyle(color: Colors.orange),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        )

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
    'https://images.unsplash.com/photo-1548865163-afb128596c1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGRhcmslMjBjaG9jb2xhdGUlMjBjYWtlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60',
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
                        'https://images.unsplash.com/photo-1548865163-afb128596c1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGRhcmslMjBjaG9jb2xhdGUlMjBjYWtlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=400&q=60',
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: Screens.height(context) * 0.7,
              width: Screens.width(context),
              margin: EdgeInsets.only(top: Screens.height(context) * 0.3),
              decoration: const BoxDecoration(
                color: Colors.white,
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
                    const Text(
                      'Dark Chocolate Cake',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: 30,
                      child: _star(context),
                    ),
                    const Text('4.5 Star Ratings'),
                    const Text('Description'),
                    const Text(
                        'Lorem ipsum dolor sit amet,consectetur adipiscing elit.'
                            'Ornare leo non mollis id cursus.Eu euismod faucibus in'
                            'leo malesuada'),
                    const Divider(thickness: 2),
                    Row(
                      children: [
                        const Text('Number of Portions'),
                        const SizedBox(
                          width: 20,
                        ),
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.orange,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          onPressed: () {},
                          child: const Icon(Icons.remove),
                        ),
                        const Text(
                          '3',
                          style: TextStyle(fontSize: 30),
                        ),
                        CupertinoButton(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.orange,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          onPressed: () {},
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
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
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 0,),
                              Column(
                                children: [
                                  const Text('Total Price'),
                                  const Text('LKR 1500'),
                                  MaterialButton(
                                    onPressed: () {},
                                    color: Colors.orange,
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Colors.orange)
                                    ),
                                    child: const Text('Add To Cart',style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                              const Icon(Icons.local_grocery_store)
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
      Icons.star_half,
      color: Colors.orange,
    )
        : const Icon(
      Icons.star,
      color: Colors.orange,
    ),
  );
}
