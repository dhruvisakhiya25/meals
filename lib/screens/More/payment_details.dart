import 'package:flutter/material.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';
import 'package:pay/pay.dart';

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

  void onGooglePayResult(paymentResult) {

  }

  TextEditingController txtCardNumber = TextEditingController();
  TextEditingController txtMM = TextEditingController();
  TextEditingController txtYY = TextEditingController();
  TextEditingController txtSecurityCode = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();

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
                  height: 40,
                  width: 300,
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
            ],
          ),
        ),
      ),
    );
  }
}
