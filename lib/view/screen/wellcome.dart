import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/screen/Authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

showDialogIfFirstLoaded(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
  if (isFirstLoaded == null) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("WellCome " + account_holder),
          content: new Text(
              "You can now read many books in your own mobile!! enjoy the elibrary..."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            GestureDetector(
              onTap: () {
                // Close the dialog
                Navigator.of(context).pop();
                prefs.setBool(keyIsFirstLoaded, false);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [colorPallateleft, colorPallateright],
                  ),
                ),
                child: new Text(
                  "Dismiss",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
