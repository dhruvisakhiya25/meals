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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Email");
                      }
                      // Reg Expression for Email Validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter Your Valid Email");
                      }
                      return null;
                    },
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
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Please Enter Your Password");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Please Valid Password(Min. 6 Character)");
                      }
                      return null;
                    },
                    controller: txtPassword,
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
                      hintText: password,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: grey),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30)),
                    ),
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
