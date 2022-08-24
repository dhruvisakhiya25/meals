// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meals/screens/login.dart';
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

  File? fileMultiImage;

  pickImage() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    print('------------------- $file');
  }

  pickCamera() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.camera);
    file = File(image!.path);
    print('------------------- $file');
  }

  @override
  void initState() {
    super.initState();
    subEntries = subMenuEntries();

    // entries = menuEntries();
  }

  List<Widget> subMenuEntries() {
    return [
      Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () async {
              await pickCamera();
              setState(() {});
              // Navigator.pop(context);
            },
          )),
      const SizedBox(
        height: 10,
      ),
      Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: () async {
              await pickImage();
              setState(() {});
            },
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [  Text(
                profile,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
              ),

                const Icon(
                  icCart,
                  color: Colors.black,
                )],
            ),

              if (userData != null)
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
                      child: const Icon(Icons.edit),
                    ),
                    badgeColor: Colors.white,
                    child: CircleAvatar(
                      radius: 53,
                      backgroundColor: Colors.black,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: file == null
                                    ? NetworkImage(
                                    userData!['picture']['data']['url'])
                                    : FileImage(File(file!.path))
                                as ImageProvider,
                                fit: BoxFit.fill),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                )
              else if (userPhoto != null)
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
                      child: const Icon(Icons.edit),
                    ),
                    badgeColor: Colors.white,
                    child: CircleAvatar(
                      radius: 53,
                      backgroundColor: Colors.black,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: file == null
                                    ? NetworkImage(
                                    userPhoto!)
                                    : FileImage(File(file!.path))
                                as ImageProvider,
                                fit: BoxFit.fill
                              // image: NetworkImage(userPhoto!),
                            ),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              if (userData != null)
                Text(
                 userData!['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              else
                Text(userEmail),
              TextButton(
                  onPressed: () async {
                    await fbLogout();
                    await googleLogOut();
                    setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
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
                        borderRadius: BorderRadius.circular(30)),
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
                    ))
              else
                Container(
                    height: 40,
                    width: Screens.width(context) * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.all(10),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                        borderRadius: BorderRadius.circular(30)),
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
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.only(left: 20),
                    margin: const EdgeInsets.all(10),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userEmail,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )),
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


