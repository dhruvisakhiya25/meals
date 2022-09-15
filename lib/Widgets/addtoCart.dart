import 'package:meals/Network/export.dart';
import 'package:meals/screens/CartPages/cart.dart';

Widget goToCart() {
  return MaterialButton(
    onPressed: () {
      Get.to(() => const Cart());
    },
    child: const Icon(icCart),
  );
}
