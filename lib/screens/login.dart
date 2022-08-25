// ignore_for_file: use_build_context_synchronously

import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meals/screens/mainPage.dart';
import 'package:meals/screens/reset_password.dart';
import 'package:meals/screens/signup.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isLoading = false;
  bool darkMode = false;
  Service servise = Service();
  final _formKey = GlobalKey<FormState>();

  AuthButtonType? buttonType;
  AuthIconType? iconType;

  ThemeMode get themeMode => darkMode ? ThemeMode.dark : ThemeMode.light;
  String getName = '';
  String getEmail = '';
  String getPhoto = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName = FacebookLoginShared.getFbLoginName.toString();
    getEmail = FacebookLoginShared.getFbLoginEmail.toString();
    getPhoto = FacebookLoginShared.getFbLoginPhoto.toString();
    // checkLogin();
  }

  bool passwords = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Text(
                      login,
                      style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(addYourDetails),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                   validator: (value) => validateEmail(value),
                    controller: txtEmail,
                    decoration: InputDecoration(
                      hintText: yourEmail,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField( autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: txtPassword,
                    textInputAction: TextInputAction.next,
                    obscureText: passwords,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            passwords = !passwords;
                            setState(() {});
                          },
                          icon: Icon(
                            passwords ? icVisibilityOff : icVisibility,
                            color: grey,
                          )),
                      prefixIconColor: orange,
                      hintText: password,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return (pleaseEnterYourPassword);
                      }
                      if (!regex.hasMatch(value)) {
                        return (pleaseValidPassword);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    height: 55,
                    minWidth: 300,
                    color: orange,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: orange),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      if (txtEmail.text.isNotEmpty &&
                          txtPassword.text.isNotEmpty) {
                        servise.loginUser(
                            txtEmail.text, txtPassword.text, context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ));
                      }
                      setState(
                        () {},
                      );
                    },
                    child: Text(
                      login,
                      style: const TextStyle(color: white, fontSize: 20),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordPage(),
                          ));
                    },
                    child: Text(
                      forgetYourPassword,
                      style: const TextStyle(color: grey),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    orLogin,
                    style: const TextStyle(color: grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FacebookAuthButton(
                    onPressed: () async {
                      await fbLogin();

                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const MainPage();
                        },
                      ));
                      FacebookLoginShared.setFbLoginName = userData!['name'];
                      FacebookLoginShared.setFbLoginEmail = userData!['email'];
                      FacebookLoginShared.setFbLoginPhoto =
                          userData!['picture']['data']['url'];
                      print('111111111111111111111${userData!}');
                    },
                    themeMode: themeMode,
                    isLoading: isLoading,
                    style: AuthButtonStyle(
                      buttonType: buttonType,
                      iconType: iconType,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GoogleAuthButton(
                    onPressed: () async {
                      await signInWithGoogle();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ));
                    },
                    themeMode: themeMode,
                    isLoading: isLoading,
                    style: AuthButtonStyle(
                      buttonType: buttonType,
                      iconType: iconType,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dontHaveAccount),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ));
                          },
                          child: Text(
                            signUp,
                            style: const TextStyle(
                                color: orange, fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FacebookLoginShared {
  static SharedPreferences? pref;
  static String logInKeyName = 'login Name';
  static String logInKeyEmail = 'login Email';
  static String logInKeyPhoto = 'login Photo';
  static String imgKey = 'userName';



  static init() async => pref = await SharedPreferences.getInstance();

  static set setFbLoginName(value) => pref!.setString(logInKeyName, value);

  static String? get getFbLoginName => pref!.getString(logInKeyName);

  static set setFbLoginEmail(value) => pref!.setString(logInKeyEmail, value);

  static String? get getFbLoginEmail => pref!.getString(logInKeyEmail);

  static set setFbLoginPhoto(value) => pref!.setString(logInKeyPhoto, value);

  static String? get getFbLoginPhoto => pref!.getString(logInKeyPhoto);

  static set setImage(value) => pref!.setString(imgKey, value);

  static String? get getImage => pref!.getString(imgKey);
}

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  userEmail = googleUser.email;
  userPhoto = googleUser.photoUrl;
  userName = googleUser.displayName;

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

String userEmail = "";

String? userName = "";

String? userPhoto = '';

Map<String, dynamic>? userData;

fbLogin() async {
  await FacebookAuth.instance.login();
  final user = await FacebookAuth.instance.getUserData();
  userData = user;
}
String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return 'Email cannot be Empty';
  }
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  else {
    return null;
  }
}