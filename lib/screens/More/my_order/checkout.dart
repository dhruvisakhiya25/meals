import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  int? value;
  TextEditingController txtCardNumber = TextEditingController();
  TextEditingController txtMM = TextEditingController();
  TextEditingController txtYY = TextEditingController();
  TextEditingController txtSecurityCode = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    List radio = [
      cashOnDelivery,
      visa,
      emailId,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            icBack,
            color: black,
          ),
        ),
        title: Text(
          checkOut,
          style: const TextStyle(
              color: black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  deliveryAddress,
                  style: const TextStyle(color: grey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          nostrand,
                          style: const TextStyle(
                              color: black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                        Text(
                          brooklyn,
                          style: const TextStyle(
                              color: black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      change,
                      style: const TextStyle(color: orange, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      paymentMethod,
                    ),
                    Text(
                      addCards,
                      style: const TextStyle(
                          color: orange, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: radio.length,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        radio[index].toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Radio(
                        activeColor: orange,
                        value: index,
                        groupValue: value,
                        onChanged: (ind) => setState(() => value = index),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: check.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      check[index]['text'],
                    ),
                    trailing: Text(
                      check[index]['price'],
                      style: const TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 350,
                  color: orange,
                  height: 45,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: orange),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        borderSide: BorderSide(color: white),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Container(
                        margin: const EdgeInsets.all(10),
                        height: 590,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(icClose),
                              ),
                            ),
                            Text(
                              addCreditCard,
                              style:
                                  const TextStyle(color: black, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: grey,
                              thickness: .4,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                controller: txtCardNumber,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: grey,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusColor: grey,
                                  hintText: cardNumber,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  expiry,
                                  style: const TextStyle(
                                      color: black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    controller: txtMM,
                                    decoration: InputDecoration(
                                      hintText: mM,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    controller: txtYY,
                                    decoration: InputDecoration(
                                      hintText: yY,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                controller: txtSecurityCode,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: grey,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusColor: grey,
                                  hintText: securityCode,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                controller: txtFirstName,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: grey,
                                      ),
                                      borderRadius: BorderRadius.circular(25)),
                                  focusColor: grey,
                                  hintText: firstName,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                controller: txtLastName,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: grey,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  focusColor: grey,
                                  hintText: lastName,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(youCanRemoveCard),
                                    Text(atAnyTime)
                                  ],
                                ),
                                StatefulBuilder(
                                  builder: (context, setState) {
                                    return Switch(
                                      value: _switchValue,
                                      onChanged: (value) {
                                        _switchValue = value;
                                        setState(
                                          () {},
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: MaterialButton(
                                minWidth: 350,
                                height: 50,
                                color: orange,
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(color: orange),
                                ),
                                onPressed: () {},
                                child: Text(
                                  addCards,
                                  style: const TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    sendOrder,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
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

List check = [
  {
    'text': 'Sub Total',
    'price': '\$68',
  },
  {'text': 'delivery Cost', 'price': '\$2'},
  {'text': 'Discount', 'price': '-\$4'},
  {'text': 'Total', 'price': '\$-66'}
];
