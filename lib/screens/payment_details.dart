import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController txtCardNumber = TextEditingController();
  TextEditingController txtMM = TextEditingController();
  TextEditingController txtYY = TextEditingController();
  TextEditingController txtSecurityCode = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_constructors
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    paymentDetails,
                    style: const TextStyle(
                        color: black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    icCart,
                    color: black,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                customPaymentMethod,
                style: const TextStyle(
                    color: black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: grey,
                thickness: 0.4,
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 30,
                child: Container(
                  height: 230,
                  width: 450,
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cashCardOnDelivery,
                              style: const TextStyle(
                                  color: black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Icon(
                              icDone,
                              color: orange,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          color: grey,
                          thickness: 0.2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              // color: Colors.red,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/image/visa.jpg'))),
                            ),
                            Text(
                              numbers,
                              style:
                                  const TextStyle(color: black, fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                              height: 35,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: orange)),
                              onPressed: () {},
                              child: Text(
                                debitCard,
                                style: const TextStyle(
                                    color: orange, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          otherMethods,
                          style: const TextStyle(
                              color: black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: MaterialButton(
                  color: orange,
                  height: 45,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: orange)),
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
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
                                  icon: const Icon(icClose)),
                            ),
                            Text(
                              addCreditDebitCard,
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
                                controller: txtCardNumber,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: grey,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusColor: grey,
                                    hintText: cardNumber,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(color: grey),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                            const BorderSide(color: grey))),
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
                                    controller: txtMM,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        hintText: mM,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
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
                                            borderRadius:
                                                BorderRadius.circular(30))),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusColor: grey,
                                    hintText: securityCode,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(color: grey),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                            const BorderSide(color: grey))),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusColor: grey,
                                    hintText: firstName,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(color: grey),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                            const BorderSide(color: grey))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                textInputAction: TextInputAction.done,
                                controller: txtLastName,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: grey,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    focusColor: grey,
                                    hintText: lastName,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: const BorderSide(color: grey),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide:
                                            const BorderSide(color: grey))),
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
                                    borderSide:
                                        const BorderSide(color: orange)),
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
                    addAnotherCreditCard,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
