import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? pref;
  static String fbLoginName = 'login fbName';
  static String fbLoginEmail = 'login fbEmail';
  static String fbLoginPhoto = 'login fbPhoto';
  static String googleLoginName = 'login googleName';
  static String googleLoginEmail = 'login googleEmail';
  static String googleLoginPhoto = 'login googlePhoto';
  static String imgKey = 'userName';

  static init() async => pref = await SharedPreferences.getInstance();

  static set setProfileImage(value) => pref!.setString(imgKey, value);

  static String? get getProfileImage => pref!.getString(imgKey);

  static set setFbLoginName(value) => pref!.setString(fbLoginName, value);

  static String? get getFbLoginName => pref!.getString(fbLoginName);

  static set setFbLoginEmail(value) => pref!.setString(fbLoginEmail, value);

  static String? get getFbLoginEmail => pref!.getString(fbLoginEmail);

  static set setFbLoginPhoto(value) => pref!.setString(fbLoginPhoto, value);

  static String? get getFbLoginPhoto => pref!.getString(fbLoginPhoto);
}
