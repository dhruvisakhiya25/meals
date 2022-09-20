// ignore_for_file: deprecated_member_use

import 'package:flutter_credit_card_brazilian/credit_card_form.dart';
import 'package:flutter_credit_card_brazilian/credit_card_model.dart';
import 'package:flutter_credit_card_brazilian/credit_card_widget.dart';
import 'package:meals/Network/export.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final _paymentItems = [
    const PaymentItem(
      label: 'Total',
      amount: '0',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onApplePayResult(paymentResult) {}

  void onGooglePayResult(paymentResult) {}

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? value;

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
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            CreditCardWidget(
                              cardName: (String value) {
                                // ignore: avoid_print
                                print(value);
                              },
                              cardNumber: cardNumber,
                              expiryDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cvvCode: cvvCode,
                              showBackView: isCvvFocused,
                              obscureCardNumber: true,
                              obscureCardCvv: true,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    // ignore: sized_box_for_whitespace
                                    Container(
                                      height: 500,
                                      child: Column(
                                        children: [
                                          CreditCardForm(
                                            formKey: formKey,
                                            obscureCvv: true,
                                            obscureNumber: true,
                                            cardNumber: cardNumber,
                                            cvvCode: cvvCode,
                                            cardHolderName: cardHolderName,
                                            expiryDate: expiryDate,
                                            themeColor: blue,
                                            cardNumberDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'card holder',
                                              hintText: 'XXXX XXXX XXXX XXXX',
                                            ),
                                            expiryDateDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Validade',
                                              hintText: 'XX/XX',
                                            ),
                                            cvvCodeDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'CVV',
                                              hintText: 'XXX',
                                            ),
                                            cardHolderDecoration:
                                                const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'card holder',
                                            ),
                                            onCreditCardModelChange:
                                                onCreditCardModelChange,
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              primary: navyBlue,
                                            ),
                                            child: Container(
                                              margin: const EdgeInsets.all(8),
                                              child: const Text(
                                                'Validate',
                                                style: TextStyle(
                                                  color: white,
                                                  fontFamily: 'halter',
                                                  fontSize: 14,
                                                  package:
                                                      'flutter_credit_card',
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                // ignore: avoid_print
                                                print('valid!');
                                              } else {
                                                // ignore: avoid_print
                                                print('invalid!');
                                              }
                                            },
                                          ),
                                        ],
                                      ),
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
                  child: Text(
                    sendOrder,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ApplePayButton(
                    width: 350,
                    paymentConfigurationAsset: 'apple.json',
                    paymentItems: _paymentItems,
                    style: ApplePayButtonStyle.white,
                    onPaymentResult: onApplePayResult,
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: GooglePayButton(
                    width: 350,
                    paymentConfigurationAsset:
                        'default_payment_profile_google_pay.json',
                    paymentItems: _paymentItems,
                    type: GooglePayButtonType.order,
                    onPaymentResult: onGooglePayResult,
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
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

List check = [
  {
    'text': 'Sub Total',
    'price': '\$68',
  },
  {'text': 'delivery Cost', 'price': '\$2'},
  {'text': 'Discount', 'price': '-\$4'},
  {'text': 'Total', 'price': '\$-66'}
];
