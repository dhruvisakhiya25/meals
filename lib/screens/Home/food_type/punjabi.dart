import '../../../Network/export.dart';

class Punjabi extends StatefulWidget {
  const Punjabi({Key? key}) : super(key: key);

  @override
  State<Punjabi> createState() => _PunjabiState();
}

class _PunjabiState extends State<Punjabi> {
  final CollectionReference _products =
  FirebaseFirestore.instance.collection('punjabi');
  late Stream<QuerySnapshot> _streams;

  @override

  void initState() {
    super.initState();
    _streams = _products.snapshots();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
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
              return Expanded(
                child: ListView.builder(
                  itemCount: document.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot documents = document[index];
                    return Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  documents['punjabi image'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),

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
