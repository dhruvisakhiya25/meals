import 'package:flutter/cupertino.dart';
import 'package:meals/Network/export.dart';

class Bevagers extends StatefulWidget {
  const Bevagers({Key? key}) : super(key: key);

  @override
  State<Bevagers> createState() => _BevagersState();
}

class _BevagersState extends State<Bevagers> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('bevagers');
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          if (index == 0) {
                            Get.toNamed('/fooddrink');
                          }if (index == 1) {
                            Get.toNamed('/strawberryjuice');
                          }if (index == 2) {
                            Get.toNamed('/drinks');
                          }if (index == 3) {
                            Get.toNamed('/lemonjuice');
                          }if (index == 4) {
                            Get.toNamed('/oreomilkshake');
                          }
                        },
                        child: Container(
                          height: 300,
                          width: 100,
                          decoration: BoxDecoration(
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

