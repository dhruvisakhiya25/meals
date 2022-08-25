import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meals/screens/login.dart';
import 'package:meals/screens/mainPage.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/strings.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  Service servise = Service();

  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  bool passwords = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      signUp,
                      style: const TextStyle(
                          color: black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: txtName,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: name,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    validator: (value) {
                      RegExp regex = RegExp('[a-zA-Z]');
                      if (value!.isEmpty) {
                        return (firstNameEmpty);
                      }
                      if (!regex.hasMatch(value)) {
                        return (pleaseValidName);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: txtEmail,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: email,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return (pleaseEnterYourEmail);
                      }
                      // Reg Expression for Email Validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return (pleaseValidEmail);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: txtMobile,
                    textInputAction: TextInputAction.next,
                    maxLength: 10,
                    decoration: InputDecoration(
                        hintText: mobile,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{10,}$');
                      if (value!.isEmpty) {
                        return (pleaseEnterYourMobile);
                      }
                      if (!regex.hasMatch(value)) {
                        return (pleaseValidMobile);
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: txtAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: address,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(30),
                        )),
                    validator: (value) {
                      RegExp regex = RegExp(
                          '[0-9\\/# ,a-zA-Z]+[ ,]+[0-9\\/#, a-zA-Z]{1,}');
                      if (value!.isEmpty) {
                        return (pleaseEnterYourAddress);
                      }
                      if (!regex.hasMatch(value)) {
                        return (pleaseEnterValidAddress);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: txtConfirmPassword,
                    textInputAction: TextInputAction.done,
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
                      hintText: confirmPassword,
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
                      if (txtConfirmPassword.text != txtPassword.text) {
                        return (passwordNoMatch);
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: MaterialButton(
                      height: 55,
                      minWidth: 300,
                      color: orange,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: orange),
                      ),
                      onPressed: () async {
                        if (txtEmail.text.isNotEmpty &&
                            txtConfirmPassword.text.isNotEmpty &&
                            _formKey.currentState!.validate()) {
                          servise.createUser(
                              txtEmail.text, txtConfirmPassword.text, context);
                        }
                        setState(() {});
                      },
                      child: Text(
                        signUp,
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(alreadyAnHaveAccount),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: Text(
                            login,
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

class Service {
  final auth = FirebaseAuth.instance;

  createUser(email, password, context) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    });
  }

  loginUser(email, password, context) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    });
  }
}
