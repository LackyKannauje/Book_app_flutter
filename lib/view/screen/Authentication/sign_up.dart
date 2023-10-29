import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/Components/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController emailText = TextEditingController();
TextEditingController passText = TextEditingController();
TextEditingController lastNameHolder = TextEditingController();
TextEditingController firstNameHolder = TextEditingController();

String account_holder = "";
String keyIsFirstLoaded = '';
bool passwordVisible = false;
FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                margin: EdgeInsets.only(top: 40),
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
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 400,
                      width: 295,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: firstNameHolder,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: colorPallateright, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    // color: Color.fromARGB(255, 253, 253, 253),
                                    ),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.edit_note,
                                    color: const Color.fromARGB(
                                        255, 186, 183, 183)),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            controller: lastNameHolder,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: colorPallateright, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    // color: Color.fromARGB(255, 253, 253, 253),
                                    ),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.edit_note,
                                    color: const Color.fromARGB(
                                        255, 186, 183, 183)),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: emailText,
                            keyboardType: TextInputType.emailAddress,
                            // enabled: false,
                            decoration: InputDecoration(
                              hintText: 'Enter your Email Address',
                              hintStyle: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: colorPallateright,
                                    // color: Color.fromARGB(255, 79, 183, 83),
                                    width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    // color: Color.fromARGB(255, 253, 253, 253),
                                    ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 0, 0)),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.email,
                                    color: const Color.fromARGB(
                                        255, 186, 183, 183)),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: passText,
                            // enabled: false,
                            obscureText: passwordVisible,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(
                                  // color: Colors.white,
                                  fontSize: 15,
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
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 245, 0, 0)),
                              ),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.lock,
                                    color: const Color.fromARGB(
                                        255, 186, 183, 183)),
                                onPressed: () {},
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
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
                          GestureDetector(
                            onTap: () async {
                              try {
                                await _auth.createUserWithEmailAndPassword(
                                  email: emailText.text,
                                  password: passText.text,
                                );
                                keyIsFirstLoaded = 'is_first_loaded';
                                emailText.text = "";
                                passText.text = "";
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Container(
                                        // padding: EdgeInsets.all(10),
                                        height: 130,
                                        child: Column(
                                          children: [
                                            Text(firstNameHolder.text
                                                    .toString() +
                                                " " +
                                                lastNameHolder.text.toString() +
                                                ", you are succussfully registered\nplease click Start to begin!!"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage(),
                                                      ),
                                                    );
                                                    final prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    await prefs.setString(
                                                        'account_holder',
                                                        firstNameHolder.text +
                                                            " " +
                                                            lastNameHolder
                                                                .text);
                                                    setState(() {
                                                      account_holder =
                                                          firstNameHolder.text +
                                                              " " +
                                                              lastNameHolder
                                                                  .text;
                                                      firstNameHolder.text = "";
                                                      lastNameHolder.text = "";
                                                    });
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          colorPallateleft,
                                                          colorPallateright
                                                        ],
                                                      ),
                                                    ),
                                                    child: Text("Start"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
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
                              height: 45,
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
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
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
