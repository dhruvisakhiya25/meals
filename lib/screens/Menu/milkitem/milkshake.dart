
import 'package:flutter/cupertino.dart';

import '../../../Network/export.dart';

class MilkShake extends StatefulWidget {
  const MilkShake({Key? key}) : super(key: key);

  @override
  State<MilkShake> createState() => _MilkShakeState();
}

class _MilkShakeState extends State<MilkShake> {
  int counter = 0;

  void increment() {
    setState(
          () {
        counter++;
      },
    );
  }

  void decrement() {
    setState(
          () {
        counter--;
      },
    );
  }

  final CollectionReference _products =
  FirebaseFirestore.instance.collection('milkshake');
  late Stream<QuerySnapshot> _streams;

  @override
  void initState() {
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
                                    documents['milkshake image'],
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
                                    documents['milkshake name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    documents['milkshake rate'],
                                  ),
                                  Text(
                                    documents['milkshake decription'],
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
                                        onPressed: decrement,
                                        child: const Icon(icRemove),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '$counter',
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CupertinoButton(
                                        borderRadius: BorderRadius.circular(30),
                                        color: orange,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        onPressed: increment,
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
                                                    color: grey, blurRadius: 10)
                                              ],
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(45),
                                                bottomLeft: Radius.circular(45),
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                Radius.circular(10),
                                              ),
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
                                                        style: const TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      Text(
                                                        lkr,
                                                        style: const TextStyle(
                                                            fontSize: 27,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                      const SizedBox(
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
                                                              const Icon(
                                                                icCarts,
                                                                color: white,
                                                                size: 19,
                                                              ),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              Text(
                                                                addToCart,
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                    19,
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
                                                SizedBox(
                                                  height: 80,
                                                  child: Container(
                                                    margin:
                                                    const EdgeInsets.only(
                                                        right: 5),
                                                    height: 40,
                                                    width: 40,
                                                    decoration:
                                                    const ShapeDecoration(
                                                      shape: CircleBorder(),
                                                      color: white,
                                                      shadows: [
                                                        BoxShadow(
                                                          color: placeholder,
                                                          offset: Offset(0, 2),
                                                          blurRadius: 15,
                                                        )
                                                      ],
                                                    ),
                                                    child: const Icon(
                                                      icCart,
                                                      color: orange,
                                                    ),
                                                  ),
                                                ),
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