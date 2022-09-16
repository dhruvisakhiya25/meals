// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:meals/Network/export.dart';


class ItalianDetails extends StatefulWidget {
  int index;

  ItalianDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<ItalianDetails> createState() => _ItalianDetailsState();
}

class _ItalianDetailsState extends State<ItalianDetails> {





  final CollectionReference _products =
  FirebaseFirestore.instance.collection('italian');
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
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: NetworkImage(document[widget.index]['italian image']))
                        ),
                      )
                    ],
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
