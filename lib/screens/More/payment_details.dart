import 'package:meals/Network/export.dart';

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
  void onApplePayResult(paymentResult) {
    // Send the resulting Apple Pay token to your server / PSP
  }

  void onGooglePayResult(paymentResult) {}

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
              Center(child: ApplePayButton(
                paymentConfigurationAsset: 'apple.json',
                paymentItems: _paymentItems,
                style: ApplePayButtonStyle.black,
                type: ApplePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onApplePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
