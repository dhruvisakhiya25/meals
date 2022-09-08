// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, file_names, avoid_print

import 'package:meals/Network/export.dart';

class AuthController extends GetxController {
  String displayName = '';
  String gmailId = '';
  String gmailPhoto = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  ///Google
  final _googleSignIn = GoogleSignIn();
  var googleAcc = Rx<GoogleSignInAccount?>(null);
  var isSignedIn = false.obs;

  ///facebook
  final _facebookLogin = FacebookAuth.instance;
  var fdAcc = Rx<FacebookAuth?>(null);
  var isSignedInFb = false.obs;
  Map<String, dynamic>? userData;
  String fbName = '';

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayName = userProfile != null ? userProfile!.displayName! : '';

    super.onInit();
  }

  void signUp(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      Get.snackbar('Successful Create Account', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.black);
      update();
      Get.offAll('/mainPage');
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
      } else {}

      Get.snackbar(title, 'message',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: orange,
          colorText: black);
    } catch (e) {
      Get.snackbar('Error occurred!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: orange,
          colorText: black);
    }
  }

  void signIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayName = userProfile!.displayName!);

      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';

      if (e.code == 'wrong-password') {
        message = 'Invalid Password. Please try again!';
      } else if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: orange,
      );
      print('successful');
    } catch (e) {
      Get.snackbar(
        'Error occurred!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: orange,
      );
      print('unSuccessful');
    }
  }

  signInWithGoogle(BuildContext context) async {
    try {
      googleAcc.value = await _googleSignIn.signIn();
      displayName = googleAcc.value!.displayName!;
      gmailId = googleAcc.value!.email;
      gmailPhoto = googleAcc.value!.photoUrl!;
      isSignedIn.value = true;
      Get.offAllNamed('/mealsHome');
      Get.snackbar('Successful LogIn', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.black);
      update(); // <-- without this the isSigned value is not updated.
    } catch (e) {
      Get.snackbar('Login Failed', 'Please Try Again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: orange,
          colorText: black);
    }
  }

  signInWithFacebook(BuildContext context) async {
    try {
      fdAcc.value != await _facebookLogin.login();
      final user = await FacebookAuth.instance.getUserData();
      userData = user;
      Get.offAllNamed('/mealsHome');
      Get.snackbar('Successful LogIN', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.black);
    } catch (e) {
      Get.snackbar('Login Failed', 'Please Try Again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: orange,
          colorText: black);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.snackbar('Successful Reset Password Email Sent', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.black);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';

      if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: white,
          colorText: black);
      // Get.offAllNamed('/loginPage');
    } catch (e) {
      Get.snackbar('Error occurred!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: orange,
          colorText: black);
    }
  }

  signOut() async {
    try {
      await auth.signOut();
      await FirebaseAuth.instance.signOut();
      googleAcc.value = await _googleSignIn.signOut();
      displayName = '';
      gmailId = '';
      gmailPhoto = '';
      fdAcc.value != _facebookLogin.logOut();
      userData = null;
      isSignedIn.value = false;
      update();
      Get.offAll(() => const LoginPage());
      Get.snackbar('Successful Logout', '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.black);
    } catch (e) {
      Get.snackbar('Error occurred!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: orange,
          colorText: black);
    }
  }
}
