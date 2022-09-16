import 'package:meals/Network/export.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  myOrder,
                  style: const TextStyle(
                      color: black, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVyZ2VyJTIwa2luZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kingBurger,
                            style: const TextStyle(
                                color: black,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                          ),
                          Row(
                            children: [
                              const Icon(
                                icStar,
                                color: orange,
                              ),
                              Text(
                                rate,
                                style: const TextStyle(color: orange),
                              ),
                              Text(
                                rating,
                                style: const TextStyle(color: grey),
                              )
                            ],
                          ),
                          Text(
                            burgerWesternFood,
                            style: const TextStyle(color: grey),
                          ),
                          Row(
                            children: [
                              const Icon(
                                icLocation,
                                color: orange,
                              ),
                              Text(
                                numberThree,
                                style: const TextStyle(color: grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: order.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        title: Text(
                          order[index]['title'],
                        ),
                        trailing: Text(
                          order[index]['price'],
                          style: const TextStyle(
                              color: black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(
                        color: grey,
                        thickness: 0.5,
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Text(deliveryInstruction),
                  trailing: Text(
                    addNotes,
                    style: const TextStyle(color: orange, fontSize: 20),
                  ),
                ),
                const Divider(
                  color: grey,
                ),
                ListTile(
                  title: Text(subTotal),
                  trailing: Text(
                    sixtyEight,
                    style: const TextStyle(color: orange, fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(deliveryCost),
                  trailing: Text(
                    tow,
                    style: const TextStyle(color: orange, fontSize: 20),
                  ),
                ),
                const Divider(
                  color: grey,
                ),
                ListTile(
                  title: Text(total),
                  trailing: Text(
                    seventy,
                    style: const TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                MaterialButton(
                  minWidth: 350,
                  height: 50,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: orange),
                  ),
                  onPressed: () {
                    Get.toNamed('/checkOutPage');
                  },
                  color: orange,
                  child: Text(
                    checkOut,
                    style: const TextStyle(color: white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List order = [
  {'title': 'Beef Birger x1', 'price': '\$16'},
  {'title': 'Classic Burger x1', 'price': '\$14'},
  {'title': 'Cheese Chicken Burger x1', 'price': '\$17'},
  {'title': 'Chicken legs Basket x1', 'price': '\$15'},
  {'title': 'French Fries Large x1', 'price': '\$6'}
];
