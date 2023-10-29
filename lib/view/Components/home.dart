import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/Components/explorer.dart';
import 'package:college_project/view/Components/homeTab.dart';
import 'package:college_project/view/Components/profile.dart';
import 'package:college_project/view/Components/save.dart';
import 'package:college_project/view/Components/study.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

int pageIndex = 2;
final pages = [
  HomePageTab(),
  ExplorerPage(),
  StudyPage(
    search: "books",
  ),
  SavedBooksPage(),
  ProfilePage(),
];

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool x = false;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: pageIndex,
        gradient: LinearGradient(colors: [colorPallateleft, colorPallateright]),
        color: Colors.white,
        activeColor: Colors.white,
        height: 70,
        items: const [
          TabItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: 'Home',
            activeIcon: Icons.home_outlined,
          ),
          TabItem(
              icon: Icon(
                Icons.explore,
                color: Colors.white,
              ),
              title: 'Explore',
              activeIcon: Icons.explore_outlined),
          TabItem(
              icon: Icon(
                Icons.import_contacts,
                color: Colors.white,
              ),
              title: 'Study',
              activeIcon: Icons.local_library_outlined),
          TabItem(
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              title: 'Saved',
              activeIcon: Icons.bookmark_outline),
          TabItem(
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              title: 'Profile',
              activeIcon: Icons.person_outline),
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
