import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/Components/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:college_project/view/screen/Authentication/forget.dart';
import 'package:college_project/view/screen/Authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

TextEditingController emailText = TextEditingController();
TextEditingController passText = TextEditingController();
var passwordVisible = true;
FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPageNew extends StatefulWidget {
  LoginPageNew({super.key});
  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: 300,
                height: 600,
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('asset/profile_3135715.png'),
                              maxRadius: 50,
                              minRadius: 40,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'USER NAME',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 186, 183, 183)),
                              ),
                            ),
                          ],
                        )),
                    TextField(
                      controller: emailText,
                      // style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      // enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(
                            // color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                              BorderSide(color: colorPallateright, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              // color: Color.fromARGB(255, 253, 253, 253),
                              ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: const Color.fromARGB(255, 186, 183, 183),
                          // color: colorPallateright,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passText,
                      // style: TextStyle(color: Colors.white),
                      // enabled: false,

                      obscureText: passwordVisible,
                      obscuringCharacter: '*',
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(
                            // color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(

                              // color: Color.fromARGB(255, 79, 183, 83),
                              color: colorPallateright,
                              width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                              // color: Color.fromARGB(255, 255, 255, 255),
                              ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 245, 0, 0)),
                        ),
                        prefixIcon: Icon(Icons.lock,
                            color: const Color.fromARGB(255, 186, 183, 183)),
                        // suffixIcon: IconButton(
                        //   icon: Icon(
                        //     Icons.remove_red_eye,
                        //     color: const Color.fromARGB(255, 186, 183, 183),
                        //   ),
                        //   onPressed: () {},
                        // ),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: const Color.fromARGB(255, 186, 183, 183),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 200,
                      width: 295,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                await _auth.signInWithEmailAndPassword(
                                  email: emailText.text,
                                  password: passText.text,
                                );

                                emailText.text = "";
                                passText.text = "";
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(e.toString()),
                                    );
                                  },
                                );
                              }
                            },
                            child: Container(
                              width: 450,
                              height: 40,
                              margin: EdgeInsets.only(top: 40),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10, color: colorPallateright)
                                ],
                                // color: Color.fromARGB(255, 79, 183, 83),
                                gradient: LinearGradient(colors: [
                                  colorPallateleft,
                                  colorPallateright
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            child: GradientText(
                              'Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              colors: [colorPallateleft, colorPallateright],
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Forgot_Password1(),
                                ),
                              );
                            },
                          ),
                          TextButton(
                            child: GradientText(
                              "Don't have accout Sign Up!",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                              colors: [colorPallateleft, colorPallateright],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
