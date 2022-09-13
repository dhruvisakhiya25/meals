// ignore_for_file: deprecated_member_use

import 'package:meals/Network/export.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
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
    setState(
      () {
        cardNumber = creditCardModel!.cardNumber;
        expiryDate = creditCardModel.expiryDate;
        cardHolderName = creditCardModel.cardHolderName;
        cvvCode = creditCardModel.cvvCode;
        isCvvFocused = creditCardModel.isCvvFocused;
      },
    );
  }

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
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
              Center(
                child: GooglePayButton(
                  width: 310,
                  paymentConfigurationAsset: 'gpay.json',
                  paymentItems: _paymentItems,
                  style: GooglePayButtonStyle.white,
                  type: GooglePayButtonType.order,
                  onPaymentResult: onGooglePayResult,
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
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
                height: 30,
              ),
              Center(
                child: MaterialButton(
                  height: 47,
                  minWidth: 310,
                  color: orange,
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
                              cardNumber: cardNumber,
                              expiryDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cvvCode: cvvCode,
                              showBackView: isCvvFocused,
                              obscureCardNumber: true,
                              obscureCardCvv: true,
                              isHolderNameVisible: true,
                              cardBgColor: red,
                              isSwipeGestureEnabled: true,
                              onCreditCardWidgetChange:
                                  (CreditCardBrand creditCardBrand) {},
                              customCardTypeIcons: const <CustomCardTypeIcon>[],
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
                                      isHolderNameVisible: true,
                                      isCardNumberVisible: true,
                                      isExpiryDateVisible: true,
                                      cardHolderName: cardHolderName,
                                      expiryDate: expiryDate,
                                      themeColor: blue,
                                      cardNumberDecoration: InputDecoration(
                                        labelText: number,
                                        hintText: xxxx,
                                        hintStyle:
                                            const TextStyle(color: black),
                                        labelStyle:
                                            const TextStyle(color: black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                      ),
                                      expiryDateDecoration: InputDecoration(
                                        hintStyle:
                                            const TextStyle(color: black),
                                        labelStyle:
                                            const TextStyle(color: black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        labelText: expiryDate,
                                        hintText: xx,
                                      ),
                                      cvvCodeDecoration: InputDecoration(
                                        hintStyle:
                                            const TextStyle(color: black),
                                        labelStyle:
                                            const TextStyle(color: black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        labelText: cvv,
                                        hintText: xxx,
                                      ),
                                      cardHolderDecoration: InputDecoration(
                                        hintStyle:
                                            const TextStyle(color: black),
                                        labelStyle:
                                            const TextStyle(color: black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        labelText: cardHolder,
                                      ),
                                      onCreditCardModelChange:
                                          onCreditCardModelChange,
                                      textStyle: const TextStyle(
                                          color: black, fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 20,
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
                                        margin: const EdgeInsets.all(12),
                                        child: Text(
                                          validate,
                                          style: const TextStyle(
                                            color: white,
                                            fontFamily: 'halter',
                                            fontSize: 14,
                                            package: 'flutter_credit_card',
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          // ignore: avoid_print
                                          print(valid);
                                        } else {
                                          // ignore: avoid_print
                                          print(inValid);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Text(addAnotherCreditCard,
                      style: const TextStyle(
                          color: white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
