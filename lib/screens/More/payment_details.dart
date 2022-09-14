// // ignore_for_file: deprecated_member_use
//
// import 'package:flutter_credit_card/credit_card_brand.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
// import 'package:meals/Network/export.dart';
//
// class PaymentDetails extends StatefulWidget {
//   const PaymentDetails({Key? key}) : super(key: key);
//
//   @override
//   State<PaymentDetails> createState() => _PaymentDetailsState();
// }
//
// class _PaymentDetailsState extends State<PaymentDetails> {
//   final _paymentItems = [
//     const PaymentItem(
//       label: 'Total',
//       amount: '0',
//       status: PaymentItemStatus.final_price,
//     )
//   ];
//
//   void onApplePayResult(paymentResult) {}
//
//   void onGooglePayResult(paymentResult) {}
//
//   void onCreditCardModelChange(CreditCardModel? creditCardModel) {
//     setState(
//       () {
//         cardNumber = creditCardModel!.cardNumber;
//         expiryDate = creditCardModel.expiryDate;
//         cardHolderName = creditCardModel.cardHolderName;
//         cvvCode = creditCardModel.cvvCode;
//         isCvvFocused = creditCardModel.isCvvFocused;
//       },
//     );
//   }
//
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   bool useGlassMorphism = false;
//   bool useBackgroundImage = false;
//   OutlineInputBorder? border;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   void initState() {
//     border = OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.grey.withOpacity(0.7),
//         width: 2.0,
//       ),
//     );
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     paymentDetails,
//                     style: const TextStyle(
//                         color: black,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   const Icon(
//                     icCart,
//                     color: black,
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 customPaymentMethod,
//                 style: const TextStyle(
//                     color: black, fontSize: 20, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Divider(
//                 color: grey,
//                 thickness: 0.4,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: GooglePayButton(
//                   width: 310,
//                   paymentConfigurationAsset: 'gpay.json',
//                   paymentItems: _paymentItems,
//                   style: GooglePayButtonStyle.white,
//                   type: GooglePayButtonType.order,
//                   onPaymentResult: onGooglePayResult,
//                   loadingIndicator: const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: ApplePayButton(
//                   width: 350,
//                   paymentConfigurationAsset: 'apple.json',
//                   paymentItems: _paymentItems,
//                   style: ApplePayButtonStyle.white,
//                   onPaymentResult: onApplePayResult,
//                   loadingIndicator: const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: MaterialButton(
//                   height: 47,
//                   minWidth: 310,
//                   color: orange,
//                   shape: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     borderSide: const BorderSide(color: orange),
//                   ),
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Column(
//                           children: [
//                             CreditCardWidget(
//                               glassmorphismConfig:
//                               useGlassMorphism ? Glassmorphism.defaultConfig() : null,
//                               cardNumber: cardNumber,
//                               expiryDate: expiryDate,
//                               cardHolderName: cardHolderName,
//                               cvvCode: cvvCode,
//                               bankName: 'Axis Bank',
//                               showBackView: isCvvFocused,
//                               obscureCardNumber: true,
//                               obscureCardCvv: true,
//                               isHolderNameVisible: true,
//                               cardBgColor: Colors.red,
//                               backgroundImage:
//                               useBackgroundImage ? 'assets/card_bg.png' : null,
//                               isSwipeGestureEnabled: true,
//                               onCreditCardWidgetChange:
//                                   (CreditCardBrand creditCardBrand) {},
//                               customCardTypeIcons: <CustomCardTypeIcon>[
//                                 CustomCardTypeIcon(
//                                   cardType: CardType.mastercard,
//                                   cardImage: Image.asset(
//                                     'assets/mastercard.png',
//                                     height: 48,
//                                     width: 48,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Expanded(
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   children: <Widget>[
//                                     CreditCardForm(
//                                       formKey: formKey,
//                                       obscureCvv: true,
//                                       obscureNumber: true,
//                                       cardNumber: cardNumber,
//                                       cvvCode: cvvCode,
//                                       isHolderNameVisible: true,
//                                       isCardNumberVisible: true,
//                                       isExpiryDateVisible: true,
//                                       cardHolderName: cardHolderName,
//                                       expiryDate: expiryDate,
//                                       themeColor: Colors.blue,
//                                       textColor: Colors.white,
//                                       cardNumberDecoration: InputDecoration(
//                                         labelText: 'Number',
//                                         hintText: 'XXXX XXXX XXXX XXXX',
//                                         hintStyle: const TextStyle(color: Colors.black),
//                                         labelStyle: const TextStyle(color: Colors.black),
//                                         focusedBorder: border,
//                                         enabledBorder: border,
//                                       ),
//                                       expiryDateDecoration: InputDecoration(
//                                         hintStyle: const TextStyle(color: Colors.black),
//                                         labelStyle: const TextStyle(color: Colors.black),
//                                         focusedBorder: border,
//                                         enabledBorder: border,
//                                         labelText: 'Expired Date',
//                                         hintText: 'XX/XX',
//                                       ),
//                                       cvvCodeDecoration: InputDecoration(
//                                         hintStyle: const TextStyle(color: Colors.black),
//                                         labelStyle: const TextStyle(color: Colors.black),
//                                         focusedBorder: border,
//                                         enabledBorder: border,
//                                         labelText: 'CVV',
//                                         hintText: 'XXX',
//                                       ),
//                                       cardHolderDecoration: InputDecoration(
//                                         hintStyle: const TextStyle(color: Colors.black),
//                                         labelStyle: const TextStyle(color: Colors.black),
//                                         focusedBorder: border,
//                                         enabledBorder: border,
//                                         labelText: 'Card Holder',
//                                       ),
//                                       onCreditCardModelChange: onCreditCardModelChange,
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         const Text(
//                                           'Glassmorphism',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                         Switch(
//                                           value: useGlassMorphism,
//                                           inactiveTrackColor: Colors.grey,
//                                           activeColor: Colors.black,
//                                           activeTrackColor: Colors.green,
//                                           onChanged: (bool value) => setState(() {
//                                             useGlassMorphism = value;
//                                           }),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         const Text(
//                                           'Card Image',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18,
//                                           ),
//                                         ),
//                                         Switch(
//                                           value: useBackgroundImage,
//                                           inactiveTrackColor: Colors.grey,
//                                           activeColor: Colors.black,
//                                           activeTrackColor: Colors.green,
//                                           onChanged: (bool value) => setState(() {
//                                             useBackgroundImage = value;
//                                           }),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 20,
//                                     ),
//                                     ElevatedButton(
//                                       style: ElevatedButton.styleFrom(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(8.0),
//                                         ),
//                                         primary: const Color(0xff1b447b),
//                                       ),
//                                       child: Container(
//                                         margin: const EdgeInsets.all(12),
//                                         child: const Text(
//                                           'Validate',
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontFamily: 'halter',
//                                             fontSize: 14,
//                                             package: 'flutter_credit_card',
//                                           ),
//                                         ),
//                                       ),
//                                       onPressed: () {
//                                         if (formKey.currentState!.validate()) {
//                                           print('valid!');
//                                         } else {
//                                           print('invalid!');
//                                         }
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: Text(addAnotherCreditCard,
//                       style: const TextStyle(
//                           color: white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold)),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_credit_card_brazilian/credit_card_form.dart';
import 'package:flutter_credit_card_brazilian/credit_card_model.dart';
import 'package:flutter_credit_card_brazilian/flutter_credit_card.dart';



class MySample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySampleState();
  }
}

class MySampleState extends State<MySample> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardName: (String value) {
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
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: Colors.blue,
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'card holder',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Validade',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'card holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          primary: const Color(0xff1b447b),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: const Text(
                            'Validate',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('valid!');
                          } else {
                            print('invalid!');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}