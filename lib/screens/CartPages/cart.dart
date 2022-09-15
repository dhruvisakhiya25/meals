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
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Dismissible(
          key: Key(cart[index]['name']),
          direction: DismissDirection.endToStart,
          background: slideLeftBackground(),
          onDismissed: (direction) {
            cart.removeAt(index);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item Delete'),
              ),
            );
          },
          child: Container(
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
                      Text(
                        cart[index]['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 40),
                      ),
                      Text(cart[index]['rate'].toString()),
                      Text(cart[index]['description'],
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
