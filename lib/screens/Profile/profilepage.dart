// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';
import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meals/screens/login/login.dart';
import 'package:meals/screens/shared_pref/shared_pref.dart';
import 'package:meals/utils/color.dart';
import 'package:meals/utils/icon.dart';
import 'package:meals/utils/responsive.dart';
import 'package:meals/utils/strings.dart';
import 'package:star_menu/star_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late List<Widget> subEntries;
  File? file;
  String? getData;

  pickImage() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
  }

  pickCamera() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.camera);
    file = File(image!.path);
  }

  @override
  void initState() {
    super.initState();
    subEntries = subMenuEntries();
    getData = SharedPref.getProfileImage.toString();
    
  }

  List<Widget> subMenuEntries() {
    return [
      Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: const Icon(icCamera),
          title: const Text('Camera'),
          onTap: () async {
            await pickCamera();
            setState(
              () {},
            );
          },
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: const Icon(icImage),
          title: const Text('Gallery'),
          onTap: () async {
            await pickImage();
            SharedPref.setProfileImage = file!.path.toString();

            setState(() {});
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    profile,
                    style: const TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const Icon(
                    icCart,
                    color: black,
                  )
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Text(userEmail),
              Center(
                child: Badge(
                  position: BadgePosition.bottomEnd(),
                  badgeContent: StarMenu(
                    params: const StarMenuParameters(
                      linearShapeParams:
                          LinearShapeParams(alignment: LinearAlignment.right),
                      shape: MenuShape.linear,
                      openDurationMs: 1200,
                    ),
                    items: subEntries,
                    child: const Icon(icEdit),
                  ),
                  badgeColor: white,
                  child: CircleAvatar(
                    radius: 53,
                    backgroundColor: black,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: SharedPref.getProfileImage == null
                                  ? NetworkImage(
                                      SharedPref.getFbLoginPhoto.toString(),
                                    )
                                  : FileImage(
                                      File(
                                        SharedPref.getProfileImage.toString(),
                                      ),
                                    ) as ImageProvider,
                              fit: BoxFit.fill),
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
              Text(
                SharedPref.getFbLoginName.toString(),
              ),
              Text(
                SharedPref.getFbLoginEmail.toString(),
              ),
              TextButton(
                  onPressed: () async {
                    await fbLogout();
                    SharedPref.setFbLoginName = '';
                    SharedPref.setFbLoginEmail = '';
                    SharedPref.setFbLoginPhoto = '';
                    await googleLogOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );

                    SharedPref.setProfileImage = '';
                    SharedPref.setGoogleName = '';
                    SharedPref.setGoogleEmail = '';
                    SharedPref.setGooglePhoto = '';

                    setState(() {});
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.grey),
                  )),
              if (userData != null)
                Container(
                  height: 50,
                  width: Screens.width(context) * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.only(left: 20),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userData!['name'],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                )
              else
                Container(
                    height: 40,
                    width: Screens.width(context) * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName!,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
              if (userData != null)
                Container(
                    height: 50,
                    width: Screens.width(context) * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData!['email'],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ))
              else
                Container(
                  height: 40,
                  width: Screens.width(context) * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.only(left: 20),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userEmail,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

fbLogout() async {
  await FacebookAuth.instance.logOut();
  userData = null;
}

googleLogOut() async {
  await FirebaseAuth.instance.signOut();
  userEmail = "";
  userPhoto = '';
  userName = '';
  await GoogleSignIn().signOut();
}

class Pro extends StatefulWidget {
  const Pro({Key? key}) : super(key: key);

  @override
  State<Pro> createState() => _ProState();
}

class _ProState extends State<Pro> {
  late List<Widget> subEntries;
  File? file;
  String? getData;

  pickImage() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
  }

  pickCamera() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.camera);
    file = File(image!.path);
  }

  @override
  void initState() {
    super.initState();
    subEntries = subMenuEntries();
    getData = SharedPref.getProfileImage.toString();
  }

  List<Widget> subMenuEntries() {
    return [
      Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: const Icon(icCamera),
          title: const Text('Camera'),
          onTap: () async {
            await pickCamera();
            setState(
              () {},
            );
          },
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: const Icon(icImage),
          title: const Text('Gallery'),
          onTap: () async {
            await pickImage();
            SharedPref.setProfileImage = file!.path.toString();

            setState(() {});
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (SharedPref.getFbLoginName != '' &&
                SharedPref.getFbLoginName != null)
              Text('Facebook Login${SharedPref.getFbLoginName.toString()}')
            else if (SharedPref.getGoogleName != '' &&
                SharedPref.getGoogleName != null)
              Text('Google Login${SharedPref.getGoogleName.toString()}')
            else if (SharedPref.getEmail != '' &&
                SharedPref.getGoogleName != null)
              Text('Email Login${SharedPref.getEmail.toString()}'),
            // if (SharedPref.getFbLoginPhoto != '' &&
            //     SharedPref.getFbLoginPhoto != null)
            Center(
              child: Badge(
                position: BadgePosition.bottomEnd(),
                badgeContent: StarMenu(
                  params: const StarMenuParameters(
                    linearShapeParams:
                        LinearShapeParams(alignment: LinearAlignment.right),
                    shape: MenuShape.linear,
                    openDurationMs: 1200,
                  ),
                  items: subEntries,
                  child: const Icon(icEdit),
                ),
                badgeColor: white,
                child: CircleAvatar(
                  radius: 53,
                  backgroundColor: black,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: SharedPref.getProfileImage == null
                                ? NetworkImage(
                                    SharedPref.getFbLoginPhoto.toString(),
                                  )
                                : FileImage(
                                    File(
                                      SharedPref.getProfileImage.toString(),
                                    ),
                                  ) as ImageProvider,
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
            // else if (SharedPref.getGooglePhoto != '' &&
            //     SharedPref.getGooglePhoto != null)
            Center(
              child: Badge(
                position: BadgePosition.bottomEnd(),
                badgeContent: StarMenu(
                  params: const StarMenuParameters(
                    linearShapeParams:
                        LinearShapeParams(alignment: LinearAlignment.right),
                    shape: MenuShape.linear,
                    openDurationMs: 1200,
                  ),
                  items: subEntries,
                  child: const Icon(icEdit),
                ),
                badgeColor: white,
                child: CircleAvatar(
                  radius: 53,
                  backgroundColor: black,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              SharedPref.getGooglePhoto.toString(),
                            ),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  await fbLogout();
                  await googleLogOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                  SharedPref.setFbLoginName = '';
                  SharedPref.setFbLoginEmail = '';
                  SharedPref.setFbLoginPhoto = '';
                  SharedPref.setProfileImage = '';
                  SharedPref.setGoogleName = '';
                  SharedPref.setGoogleEmail = '';
                  SharedPref.setGooglePhoto = '';
                  setState(() {});
                },
                child: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.grey),
                )),
          ],
        ),
      ),
    );
  }
}
