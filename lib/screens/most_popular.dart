import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference _products =
  FirebaseFirestore.instance.collection('most');
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
      body: Column(

        children: [
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
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 3,
                  ),
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: document.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot documents = document[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          height: 130,
                          width: 220,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(documents['most image']),
                                fit: BoxFit.cover),
                          ),
                          // alignment: Alignment.bottomLeft,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              documents['most name'],
                              style: const TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Row(
                              children:  [
                                Icon(icStar,color: orange,),
                                Text(documents['most rate'].toString(),style: const TextStyle(color: orange),),
                               SizedBox(width: 3,),
                                Text(
                                 documents['most type'],

                                )
                              ],
                            )
                          ],
                        )
                      ],
                    );
                  },
                ),
              );
            },
          ),
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
