import 'dart:io';

import 'package:college_project/model/routes/edit.dart';
import 'package:college_project/view/Components/home.dart';
import 'package:college_project/view/screen/Authentication/forget.dart';
import 'package:college_project/view/screen/Authentication/login.dart';
import 'package:college_project/view/screen/Authentication/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:college_project/view/const/color.dart';

Future<void> _updateProfile() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('account_holder', account_holder);
  await prefs.setString('about', about);
}

FirebaseAuth _auth = FirebaseAuth.instance;
String about = "";

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
    _loadData();
  }
  //for the name and about
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final storedAccountHolder = prefs.getString('account_holder') ?? '';
    final storedAbout = prefs.getString('about') ?? '';

    setState(() {
      account_holder = storedAccountHolder;
      about = storedAbout;
    });
  }


  //for profile image 
  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  //for picking image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', pickedImage.path);

      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              // width:,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/banner.jpg'),
                          fit: BoxFit.cover),
                    ),
                    // width: 600,
                    height: 150,
                  ),
                  Positioned(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  // backgroundImage:
                                  //     AssetImage('asset/profile2.jpg'),
                                  backgroundImage: _image != null
                                      ? FileImage(_image!)
                                      : AssetImage('asset/profile2.jpg')
                                          as ImageProvider,
                                  radius: 70,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GradientText(
                                  // 'Kunal Verma',
                                  account_holder == ''
                                      ? 'Your Name'
                                      : account_holder,
                                  style: GoogleFonts.exo(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                  colors: [colorPallateleft, colorPallateright],
                                ),
                                GradientText(
                                  // 'Kunal Verma',
                                  about,
                                  style: GoogleFonts.exo(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  colors: [colorPallateleft, colorPallateright],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 110, left: 100),
                            child: Center(
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: CircleAvatar(
                                  radius: 22,
                                  // backgroundColor: colorPallatemid,
                                  child: Icon(
                                    // color: colorPallateleft,
                                    Icons.add_a_photo,
                                    size: 25,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.edit_outlined,
                        color: colorPallatemid,
                        size: 30,
                      ),
                      trailing: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 30,
                        color: colorPallateright,
                      ),
                      subtitle: Text('change your name, email, etc...'),
                      // subtitle: Text(subtitle),
                      title: Text(
                        'Edit Profile',
                        // title,
                        style: GoogleFonts.exo(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 69, 68, 68),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgot_Password1(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: colorPallatemid,
                        size: 30,
                      ),
                      trailing: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 30,
                        color: colorPallateright,
                      ),
                      subtitle: Text('change your password...'),
                      title: Text(
                        'Change Password',
                        style: GoogleFonts.exo(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 69, 68, 68),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      });
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.bookmark_outline,
                        color: colorPallatemid,
                        size: 30,
                      ),
                      trailing: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 30,
                        color: colorPallateright,
                      ),
                      subtitle: Text('read or buy your saved books...'),
                      title: Text(
                        'Saved & Liked Books',
                        style: GoogleFonts.exo(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 69, 68, 68),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _auth.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageNew(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: colorPallatemid,
                        size: 30,
                      ),
                      trailing: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 30,
                        color: colorPallateright,
                      ),
                      subtitle: Text('sign out or logout...'),
                      title: Text(
                        'Sign Out',
                        style: GoogleFonts.exo(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 69, 68, 68),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
