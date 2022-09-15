import 'package:meals/Network/export.dart';
import 'package:meals/screens/CartPages/cart.dart';

Widget goToCart() {
  return IconButton(
    onPressed: () {
      Get.to(() => const Cart());
    },
    icon: const Icon(icCart),
  );
}
