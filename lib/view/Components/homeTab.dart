import 'package:college_project/model/b_info.dart';
import 'package:college_project/view/Components/home.dart';
import 'package:college_project/view/Components/study.dart';
import 'package:college_project/view/const/icon_color.dart';
import 'package:college_project/view/screen/Authentication/login.dart';
import 'package:college_project/model/routes/read.dart';
import 'package:college_project/model/category.dart';
import 'package:college_project/view/screen/wellcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:college_project/view/const/color.dart';

bool isRated = false;
TextEditingController searchText = TextEditingController();
FirebaseAuth _auth = FirebaseAuth.instance;

class HomePageTab extends StatefulWidget {
  HomePageTab({super.key});

  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Logout_SearchBar(context),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "Popular category",
                      style: GoogleFonts.exo(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                CategoryOfBook(),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 239, 238, 238),
                      // borderRadius: BorderRadius.circular(10),
                      ),
                  margin: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: bookContainer.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 240,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 233, 233),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        margin: EdgeInsets.only(right: 20),
                        child: bookContainer[index],
                      );
                    },
                  ),
                ),
                Container(
                  width: 80,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(146, 16, 130, 98),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Best Seller",
                      style: GoogleFonts.exo(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                            pageIndex = 2;
                          });
                        },
                        child: GradientText(
                          "See All",
                          style: GoogleFonts.exo(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          colors: [colorPallateleft, colorPallateright],
                        ),
                      ),
                    ),
                  ],
                ),
                BookSellerInfo()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column BookSellerInfo() {
    return Column(children: [
      booksellers(
        // 'https://m.media-amazon.com/images/I/814L+vq01mL._AC_UY327_FMwebp_QL65_.jpg',
        'https://m.media-amazon.com/images/I/5197qo6Q1GL._AC_UY327_FMwebp_QL65_.jpg',

        "C++ Programming",
        "DESCRIPTION :- Are you ready to embark on a journey into the world of C++ programming, one of the most versatile and powerful programming languages? 'Mastering C++ Programming' is your comprehensive guide to becoming a proficient C++ developer, whether you're a beginner or an experienced programmer looking to enhance your skills. This book takes a step-by-step approach to teach you C++ programming from the ground up. Starting with the fundamentals of C++ syntax and data types, it gradually introduces you to more advanced concepts, design patterns, and best practices. Each chapter is carefully crafted to build upon the previous one, ensuring that you grasp the material thoroughly.",
        "4.9",
        'https://www.junkybooks.com/administrator/thebooks/64e72cac0c072-c-notes-for-professionals.pdf',
      ),
      booksellers(

          // 'https://m.media-amazon.com/images/I/71S4Y0ipUIS._AC_UY327_FMwebp_QL65_.jpg',
          'https://m.media-amazon.com/images/I/71Lvr2UF5rL._AC_UY327_FMwebp_QL65_.jpg',
          "C# Programming",
          "DESCRIPTION :- Are you ready to embark on a transformative journey into the world of C# programming? Look no further than 'Mastering C#,' the ultimate guide to becoming a proficient C# developer. This comprehensive book is your passport to mastering the intricacies of C# and unleashing its full potential in crafting powerful, elegant, and efficient software solutions.",
          "5.0",
          'https://www.junkybooks.com/administrator/thebooks/63e018cfbf21d-functional-programming-in-c-.pdf'),
      booksellers(

          // 'https://m.media-amazon.com/images/I/61+dhBLgBrL._AC_UY327_FMwebp_QL65_.jpg',
          'https://m.media-amazon.com/images/I/81kLZKHknPL._AC_UY327_FMwebp_QL65_.jpg',
          "Hacking Book",
          "DESCRIPTION :- Are you ready to embark on a thrilling journey into the world of hacking programming? ' Hacking Programming' is your essential guide to becoming a proficient hacker, equipping you with the skills and knowledge needed to navigate the digital realm with confidence. In today's interconnected world, understanding hacking programming is not just for those with malicious intentions; it's a crucial skill for cybersecurity professionals, ethical hackers, and anyone concerned about online security. This comprehensive book takes you from a beginner's level to a hacking programming ninja, providing a clear and structured path to mastery.",
          "4.5",
          'https://www.junkybooks.com/administrator/thebooks/636846257649a-hacking-beginner-to-expert-guide-to-computer-hacking.pdf'),
      booksellers(
          // 'https://m.media-amazon.com/images/I/81DlVJYtqlL._AC_UY327_FMwebp_QL65_.jpg',
          'https://m.media-amazon.com/images/I/81zYszRM7zL._AC_UY327_FMwebp_QL65_.jpg',
          "The Assessin's Blade",
          "DESCRIPTION :- One of the best fantasy book series of the past decade’ TIME The twist of a knife. The birth of a legend. Step into the world of the #1 bestselling Throne of Glass series by Sarah J. Maas with this collection of prequel novellas. Celaena Sardothien is her kingdom’s most feared assassin. Though she works for the powerful Assassin’s Guild and its scheming master, Arobynn Hamel, she yields to no one and trusts only her fellow killer-for-hire, Sam. But when Arobynn dispatches her on missions that take her from remote islands to hostile deserts, Celaena finds herself acting independently of his wishes and questioning her own allegiance. If she hopes to escape Arobynn’s clutches, Celaena will have to put her faith in her wits and her blade ... knowing that if she fails, she’ll lose not just a chance at freedom but her life. A prequel to the New York Times bestselling Throne of Glass, this collection of five novellas explores the history of this cunning assassin and her enthralling ― and deadly ― world. Included in this volume: The Assassin and the Pirate Lord The Assassin and the Healer The Assassin and the Desert The Assassin and the Underworld The Assassin and the Empire",
          "4.3",
          'https://www.junkybooks.com/administrator/thebooks/636611f1b21d8-the-assassins-blade.pdf'),
      booksellers(
        // 'https://m.media-amazon.com/images/I/71dNsRuYL7L._AC_UY327_FMwebp_QL65_.jpg',
        'https://m.media-amazon.com/images/I/8174bfBvIdL._AC_UY327_FMwebp_QL65_.jpg',
        "Mathematical Physics",
        "DESCRIPTION :- It is quite thrilling for me to offer A Crash Course on Mathematical Physics. When I was preparing for competitive examinations after being M.Sc., I wondered how a single unit of Mathematical Physics contains almost all of the Mathematics, I was taught in my B.Sc. The first thing, then, came to my mind was that I was actually preparing Mathematics for Physics. I later understood that whole Mathematics is like dishes available in a restaurant, you hardly like to be served. It leads me to shortlist my favourites as a Physics scholar. This is exactly what I am serving you.",
        "4.5",
        'https://www.junkybooks.com/administrator/thebooks/6400f089662a2-mathematical-physics.pdf',
      ),
      booksellers(
        // 'https://m.media-amazon.com/images/I/71dNsRuYL7L._AC_UY327_FMwebp_QL65_.jpg',
        'https://m.media-amazon.com/images/I/812Diwz2siL._AC_UY327_FMwebp_QL65_.jpg',
        "The Fireraisers",
        "DESCRIPTION :- Dundee, Scotland, 1862. After the mill of businessman Matthew Beaumont burns to the ground, Detective Sergeant George Watters is sent to investigate.Soon, George discovers that this is not the first property that has been targeted. When a man is found dead in the hold of a trade ship, George discovers a shocking connection between Beaumont and foreign powers threatening the very country.George tries to get to the bottom of the mystery, but clues are few and far between. What connects the enigmatic Beaumont to the murder and strange events taking place in the Dundee shipyard?",
        "4.5",
        'https://www.junkybooks.com/administrator/thebooks/62bb5c6b0f030-the-fireraisers.pdf',
      ),
    ]);
  }

  Container booksellers(
    String image,
    String bookname,
    String description,
    String rating,
    String book_link,
    // String book_url,
  ) {
    return Container(
      height: 130,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 238, 238),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 60,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
            //
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookname,
                    style: GoogleFonts.exo(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 220,
                      child: Text(
                        description,
                        style: GoogleFonts.exo(
                          fontSize: 12.5,
                          color: Color.fromARGB(255, 136, 136, 136),
                          fontWeight: FontWeight.w500,
                          textStyle: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isRated = !isRated;
                              });
                            },
                            icon: Icon(
                              isRated ? Icons.star : Icons.star_border_outlined,
                              color: Colors.orange.shade300,
                            ),
                          ),
                          Text(rating),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadPage(
                                image: image,
                                name: bookname,
                                desc: description,
                                rating: rating,
                                book_link: book_link,
                                isBookmarked: false,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Color.fromARGB(255, 16, 130, 117),
                            gradient: LinearGradient(
                              colors: [
                                colorPallateleft,
                                colorPallatemid,
                                colorPallateright
                              ],
                              // stops: [0.2, 0.5, 0.3],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Read Now",
                              style: TextStyle(
                                color: Color.fromARGB(205, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container CategoryOfBook() {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 15),
            child: Chip(
              // backgroundColor: colorPallateright,
              backgroundColor: Color.fromARGB(255, 239, 238, 238),
              //
              label: GradientText(
                categories[index],
                style:
                    GoogleFonts.exo(fontWeight: FontWeight.w600, fontSize: 15),
                colors: [colorPallateleft, colorPallateright],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
            ),
          );
        },
      ),
    );
  }

  Container Logout_SearchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              width: 330,
              margin: EdgeInsets.all(5),
              // padding: EdgeInsets.symmetric(horizontal: 5),
              child: SearchBar(
                controller: searchText,
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 10)),
                hintText: "Search...",
                //  textStyle: MaterialStatePropertyAll(),
                trailing: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      pageIndex = 2;
                      pages[2] = StudyPage(search: searchText.text);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 139, 174, 183),
                    ),
                  ),
                ],
                hintStyle: MaterialStatePropertyAll(
                  TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          shading_color(
            IconButton(
              color: colorPallateright,
              onPressed: () {
                _auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPageNew(),
                  ),
                );
              },
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}
