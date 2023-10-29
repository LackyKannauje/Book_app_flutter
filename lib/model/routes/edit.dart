import 'package:college_project/view/Components/home.dart';
import 'package:college_project/view/Components/profile.dart';
// import 'package:college_project/view/Components/profile.dart';
import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/const/icon_color.dart';
import 'package:college_project/view/screen/Authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _aboutController = TextEditingController();
TextEditingController _mobileNumber = TextEditingController();

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 40,
        leading: shading_color(
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "EDIT YOUR PROFILE",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: shading_color(
              Icon(
                Icons.settings_outlined,
                color: colorPallateright,
                size: 27,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                " Edit Name :",
                style:
                    GoogleFonts.exo(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Input_field(
                    _nameController, 'Enter Your Name', Icons.edit_square),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " Edit About :",
                style:
                    GoogleFonts.exo(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Input_field(
                    _aboutController, 'Write About Yourself', Icons.edit_note),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " Edit Mobile Number :",
                style:
                    GoogleFonts.exo(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Input_field(_mobileNumber, 'Enter Your Mobile Number',
                    Icons.mobile_friendly_outlined),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('account_holder', _nameController.text);
                  await prefs.setString('about', _aboutController.text);
                  setState(() {
                    account_holder = _nameController.text;
                    about = _aboutController.text;
                    pageIndex = 4;
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  width: 450,
                  height: 45,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: colorPallateright)
                    ],
                   
                    gradient: LinearGradient(
                        colors: [colorPallateleft, colorPallateright]),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: GoogleFonts.exo(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField Input_field(
      TextEditingController controller, String input_name, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: input_name,
        hintStyle: TextStyle(
            // color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: colorPallateright, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
              // color: Color.fromARGB(255, 253, 253, 253),
              ),
        ),
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 186, 183, 183)),
      ),
    );
  }
}
