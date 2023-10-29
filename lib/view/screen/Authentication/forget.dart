// import 'package:college_project/Forgot_Password2.dart';

import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/screen/Authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

var emailText = TextEditingController();
FirebaseAuth _auth = FirebaseAuth.instance;
bool error = false;

class Forgot_Password1 extends StatelessWidget {
  const Forgot_Password1({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 23),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('asset/FP..jpg'),
                        radius: 90,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GradientText(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 2, 101),
                            fontWeight: FontWeight.w700,
                            fontSize: 25),
                        colors: [colorPallateleft, colorPallateright],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Enter the email address associated',
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 103, 103),
                            fontSize: 17,
                            wordSpacing: 2),
                      ),
                      Text(
                        'with your account',
                        style: TextStyle(
                            color: Color.fromARGB(255, 104, 103, 103),
                            fontSize: 17,
                            wordSpacing: 2),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        width: 310,
                        // height: 50,
                        child: TextField(
                          controller: emailText,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email address',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 135, 131, 131),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  // color: Color.fromARGB(255, 4, 144, 4),
                                  color: colorPallateright,
                                  width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 206, 204, 204),
                              ),
                            ),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.email,
                                  color:
                                      const Color.fromARGB(255, 186, 183, 183)),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 320,
                        child: GestureDetector(
                          onTap: () async {
                            try {
                              // error = false;
                              await _auth.sendPasswordResetEmail(
                                  email: emailText.text);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      height: 140,
                                      child: Column(
                                        children: [
                                          Text(
                                            "the reset password link sent!!\ncheck your email to reset your password!!",
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPageNew(),
                                                ),
                                              );
                                            },
                                            child: Text("sign in"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } catch (e) {
                              // error = true;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(e.toString()),
                                  );
                                },
                              );
                            }
                            // if (error == false) {
                            //   // Navigator.of(context).push(
                            //   //   MaterialPageRoute(
                            //   //     builder: (context) =>
                            //   //         Forgot_Password2(emailText.text),
                            //   //   ),
                            //   // );
                            // }
                          },
                          child: Container(
                            width: 450,
                            height: 50,
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10, color: colorPallateright)
                              ],
                              // color: Color.fromARGB(255, 67, 128, 234),
                              gradient: LinearGradient(colors: [
                                colorPallateleft,
                                colorPallateright
                              ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(
                                'Reset Password',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
