import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/responsive.dart';
import 'package:meals/utils/strings.dart';

class Promotions extends StatefulWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  State<Promotions> createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('promotions');
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      promotion,
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
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> document = querySnapshot.docs;
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      height: 3,
                    ),
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
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 300,
                          width: 100,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                  documents['image'],
                                ),
                                fit: BoxFit.cover),
                          ),
                          alignment: Alignment.bottomLeft,
                          child: ListTile(
                            title: Text(
                              documents['txt'],
                              style: const TextStyle(color: white),
                            ),
                            subtitle: Row(
                              children: [
                                const Icon(
                                  icStar,
                                  color: orange,
                                ),
                                Text(
                                  documents['rate'].toString(),
                                  style: const TextStyle(color: orange),
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
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('promot');
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _streams,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> document = querySnapshot.docs;
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      height: 3,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: document.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot documents = document[index];
                      return Stack(
                        children: [
                          Container(
                            height: Screens.height(context) * 0.5,
                            width: Screens.width(context),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    documents['promot image'],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Container(
                            height: Screens.height(context) * 0.7,
                            width: Screens.width(context),
                            margin: EdgeInsets.only(
                                top: Screens.height(context) * 0.43),
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
                                    documents['promot name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    documents['promot rate'],
                                  ),
                                  Text(
                                    documents['promot decription'],
                                  ),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        onPressed: () {},
                                        child: const Icon(icAdd),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 175,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                          color: orange,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 300,
                                            margin: const EdgeInsets.only(
                                                top: 30, left: 40),
                                            decoration: const BoxDecoration(
                                              color: white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 10)
                                              ],
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(45),
                                                bottomLeft:
                                                Radius.circular(45),
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                Radius.circular(10),),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text(
                                                        totalPrice,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(lkr,
                                                          style: TextStyle(
                                                              fontSize: 27,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 20,
                                                            top: 3),
                                                        child: MaterialButton(
                                                          minWidth: 200,
                                                          onPressed: () {},
                                                          color: orange,
                                                          shape:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                20),
                                                            borderSide:
                                                            const BorderSide(
                                                                color:
                                                                orange),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .add_shopping_cart_sharp,
                                                                color: white,
                                                                size: 19,
                                                              ),SizedBox(width: 15,),
                                                              Text(
                                                                addToCart,
                                                                style: const TextStyle(fontSize: 19,
                                                                    color:
                                                                    white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Card(
                                                  elevation: 10,
                                                  shape: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: orange),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                  ),
                                                  child: const CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor: orange,
                                                    child: Icon(
                                                      icCart,
                                                      color: white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
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
