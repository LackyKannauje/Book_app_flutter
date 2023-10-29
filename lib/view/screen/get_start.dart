// import 'package:college_project/auth.dart';
import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/screen/Authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartNew extends StatelessWidget {
  const GetStartNew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            scale: 2,
                            image: AssetImage('asset/feature3.png'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your Personal ',
                            style: GoogleFonts.cabin(
                              color: Color.fromARGB(255, 170, 168, 168),
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Library',
                            style: GoogleFonts.cabin(
                              color: Color.fromARGB(255, 170, 168, 168),
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            ' in',
                            style: GoogleFonts.cabin(
                              color: Color.fromARGB(255, 170, 168, 168),
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your ',
                            style: GoogleFonts.cabin(
                              color: Color.fromARGB(255, 170, 168, 168),
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Pocket',
                            style: GoogleFonts.cabin(
                              color: Color.fromARGB(255, 170, 168, 168),
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Discover, browse, and buy your favorite ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 155, 153, 153),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'books anytime, anywhere.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 161, 154, 154),
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => AuthScreen(),
                          //   ),
                          // );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 300,
                          height: 50,
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                color: colorPallateright,
                                // spreadRadius: 5,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                colorPallateleft,
                                colorPallatemid,
                                colorPallateright
                              ],

                              // stops: [0.2, 0.5, 0.3],
                            ),
                            // color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                          ),
                          child: Center(
                            child: Text(
                              'Get Started',
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
    );
  }
}
