import 'dart:io';


import 'package:meals/screens/Menu/milkitem/desserts.dart';

import 'Network/export.dart';

//a
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBhFUxeDB6O5ki3R3IoAPDPEcZWjCsGR78",
          appId: "1:358514215620:ios:fd45c3c61c94a0fa629791",
          messagingSenderId: "358514215620",
          projectId: "meals-f852f"),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCQBUXo2pdipY9R9s7WSG5z9-7P7GBwxZk',
          appId: '1:358514215620:android :f81f45f22bc168ae629791',
          messagingSenderId: '358514215620',
          projectId: 'meals-f852f'),
    );
  }
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialRoute: '/',
      defaultTransition: Transition.circularReveal,
      getPages: [
        GetPage(
          name: '/mealsHome',
          page: () {
            if (SharedPref.getFbLoginName != '' &&
                SharedPref.getFbLoginName != null &&
                SharedPref.getFbLoginEmail != '' &&
                SharedPref.getFbLoginEmail != null) {
              return const MainPage();
            } else if (SharedPref.getGoogleName != '' &&
                SharedPref.getGoogleName != null) {
              return const MainPage();
            } else {
              return const MealMonkey();
            }
          },
        ),
        GetPage(
          name: '/loginPage',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/signUpPage',
          page: () => const SignUpPage(),
        ),
        GetPage(
          name: '/foods',
          page: () => const Foods(),
        ),
        GetPage(
          name: '/bevagers',
          page: () => const Bevagers(),
        ),
    GetPage(
    name: '/desserts',
    page: () => const Desserts(),
    ),
        GetPage(
          name: '/promotions',
          page: () => const Promotions(),
        ),

        GetPage(
          name: '/paymentDetails',
          page: () => const PaymentDetails(),
        ),
        GetPage(
          name: '/myOrderPage',
          page: () => const MyOrderPage(),
        ),
        GetPage(
          name: '/checkOutPage',
          page: () => const CheckOutPage(),
        ),
        GetPage(
          name: '/notificationPage',
          page: () => const NotificationPage(),
        ),
        GetPage(
          name: '/inBoxPage',
          page: () => const InBoxPage(),
        ),
        GetPage(
          name: '/aboutUsPage',
          page: () => const AboutUsPage(),
        ),
        GetPage(
          name: '/dalFry',
          page: () => const DalFry(),
        ),
        GetPage(
          name: '/idliSambhar',
          page: () => const IdliSambhar(),
        ),
        GetPage(
          name: '/dalBati',
          page: () => const DalBati(),
        ),
        GetPage(
          name: '/pizza',
          page: () => const Pizza(),
        ),
        GetPage(
          name: '/iceCream',
          page: () => const IceCream(),
        ),
        GetPage(
          name: '/cake',
          page: () => const Cake(),
        ),
        GetPage(
          name: '/chocolatecake',
          page: () => const ChocolateCake(),
        ),
        GetPage(
          name: '/milkshake',
          page: () => const MilkShake(),
        ),
        GetPage(
          name: '/oreocookiessandwich',
          page: () => const OreoCookiesSandwich(),
        ),
        GetPage(
          name: '/foodds',
          page: () => const Foodds(),
        ),
        GetPage(
          name: '/healthybites',
          page: () => const HealthyBites(),
        ),
        GetPage(
          name: '/healthydise',
          page: () => const HealthyDise(),
        ),
        GetPage(
          name: '/healthyfood',
          page: () => const HealthyFood(),
        ),
        GetPage(name: '/mainPage', page: () => const MainPage(),)
      ],
    );
  }
}
