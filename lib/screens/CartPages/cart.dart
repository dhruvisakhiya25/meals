import 'package:flutter/material.dart';
import 'package:meals/Network/export.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) => Container(
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(cart[index]['image']))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cart[index]['name']),
                    Text(cart[index]['rate'].toString()),
                    Text(cart[index]['description'],overflow: TextOverflow.visible),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
