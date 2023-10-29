import 'package:college_project/model/routes/read.dart';
import 'package:college_project/view/Components/study.dart';
import 'package:college_project/view/const/color.dart';
// import 'package:college_project/view/Components/study.dart';
import 'package:college_project/view/Components/home.dart';
import 'package:college_project/view/const/icon_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List features = [
  "eBook App",
  "eLibrary",
  "Explore Books",
  "Collections",
  "Study mode",
  "Library Site",
];

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "EXPLORE NEW BOOKS 📚",
          style: GoogleFonts.exo(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: shading_color(
              Icon(
                Icons.notifications_none_outlined,
                color: colorPallateright,
                size: 27,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 75,
              // decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: features.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            'asset/feature${index + 1}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          features[index],
                          style: GoogleFonts.exo(
                              fontSize: 11, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Books for You",
                    style: GoogleFonts.exo(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      pageIndex = 2;
                    },
                    child: Icon(
                      Icons.navigate_next,
                      color: colorPallateright,
                    ),
                  ),
                ],
              ),
            ),
            BookForYou(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Deal for You",
                    style: GoogleFonts.exo(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      pageIndex = 2;
                    },
                    child: Icon(
                      Icons.navigate_next,
                      color: colorPallateright,
                    ),
                  ),
                ],
              ),
            ),
            BookForYou(),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  categoryColumn("Sports and other activities", "sport"),
                  categoryColumn("Science Technology & Medicines", "science"),
                  categoryColumn("College books", "college"),
                  categoryColumn("Historical book", "history"),
                  categoryColumn("School Book", "school"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector categoryColumn(String category, String search) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        pageIndex = 2;
        pages[2] = StudyPage(search: search);
      },
      child: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // border: Border.all(width: 0.8, color: Colors.white),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            // bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: GoogleFonts.exo(fontSize: 17, fontWeight: FontWeight.w400),
              // colors: [colorPallateleft, colorPallateright],
            ),
            Icon(
              Icons.navigate_next,
              color: colorPallateright,
            ),
          ],
        ),
      ),
    );
  }

  Container BookForYou() {
    return Container(
      height: 300,
      // margin: EdgeInsets.only(right: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            books(
              // 'https://images-eu.ssl-images-amazon.com/images/I/519GoIrgpfL._AC_SX184_.jpg',
              // 'https://m.media-amazon.com/images/I/71SZeYQcp4L._AC_UY327_FMwebp_QL65_.jpg',
              'https://m.media-amazon.com/images/I/71RikRqK3FS._AC_UY327_FMwebp_QL65_.jpg',
              "\nTypes Of Employment Contracts In Croatia",
              'Description : The employment contract establishes the employment relationship between employer and employee and defines all rights and obligations. The employer specifically determines the place and method of work in the employment contract and is obliged to provide the worker with conditions for safe work',
              'https://www.junkybooks.com/administrator/thebooks/642730130e1f7-types-of-employment-contracts-in-croatia.pdf',
            ),
            books(
                // 'https://m.media-amazon.com/images/I/814BAk-r5HL._AC_UY327_FMwebp_QL65_.jpg',
                'https://m.media-amazon.com/images/I/71Vs-VNGhXL._AC_UY327_FMwebp_QL65_.jpg',
                "\nAffiliate Marketing And Success Systems",
                'Description : You want to start your own business online, but confused about where to go or where to begin. Obviously, you need to keep in mind that any business, whether online or not, will require time and resources, therefore, you are not ready yet, until you put these two in place. This does not mean you have to spend too much just to start your own business online, as a matter of fact , it costs nothing to sign up and start making money on Amazon, EBay and Alibaba, as long as you have something to sell, promote or service to render. Secondly, you don’t have to sell anything to make money on Amazon EBay or Alibaba, you can also make money by promoting existing products, through your Affiliate marketing and referral links. You probably have a regular job that takes most of your time, thus time may be something you rarely have, but the good news is that, you don’t have to spend several hours online before you can start making money (even 1-2 hour a day should be enough, if you know what you are doing and you have a great medium where you can easily connect with your potential clients). If you have enough time in your hands, you can decide to sell your own goods on Amazon, EBay and Alibaba. In this situation, you need to know how much time you need to search or get supplies of your products, package them, and ship them. Likewise, you need to keep in mind those shipping fees you will incur alongside other handling charges. However, if you don’t have much time to export or ship goods online, you can just find products to promote and sell. In this case, you need to know what products to search for and how to create a huge followership that can be converted into repeated sales, for the products. You need to do quite a number of researches before you decide which product to sell, because there are lots of junks out there that may never generate a single dollar. You need to also keep in mind that ecommerce websites such as Amazon, EBay and Alibaba and always in favour of customers, therefore any complaint from them means you will lose your rating and possibly the opportunity of making money on a deal. Subsequent chapters will highlight some of the things you need to do to avoid losses and maintain steady streams of income on the three largest online Ecommerce websites. Likewise, the next chapter gives you incredible figures that should lure you into starting your own business on Amazon, EBay, and Alibaba',
                'https://www.junkybooks.com/administrator/thebooks/62e3bd50e3c11-affiliate-marketing-and-success-systems.pdf'),
            books(
                // 'https://m.media-amazon.com/images/I/71UwSHSZRnS._AC_UY327_FMwebp_QL65_.jpg',
                'https://m.media-amazon.com/images/I/81luu9cp+xS._AC_UY327_FMwebp_QL65_.jpg',
                "\nBefore You Start Up",
                'Description : Are you a:“Wannabe” entrepreneur in school or college with big dreams in your eyes?“Friday-night-after-drinks” aspiring entrepreneur in your 20s/30s?“Ready-to-go” soon-to-be entrepreneur?“Already-on-the-train” entrepreneur?Loved ones of any of the above (wife/husband, boyfriend/girlfriend, friend, parents)?An aspiring VC/angel investor who has never built a business?This book has been especially written for you.If you`ve played sports, you already know how you prepare is as important as how you play. Starting up a business is no different—it needs preparation.This preparation is about understanding your “why”; about generating and testing business ideas; about building your founding team; about talking to your family; about taking care of your career and your finances. It is about getting mentally prepared to get started. This book will help you ask the right questions. It will guide you, steer you towards finding your answers.You are ambitious. You are a go-getter. You are destined to win. This book will help get you what you deserve.',
                'https://www.junkybooks.com/administrator/thebooks/63b04204ba956-social-media-marketing.pdf'),
            books(
                // 'https://m.media-amazon.com/images/I/81lZ-9E4F-S._AC_UY327_FMwebp_QL65_.jpg',
                'https://m.media-amazon.com/images/I/81Cbya9-bZL._AC_UY327_QL65_.jpg',
                "\nHandbook Of Medicinal Herbs",
                'Description : With the growing trend towards ‘organic’ products and ‘coming back to nature’ worldwide, the rising interest in herbs and herbal remedies, in culinary use, health products, medicine, cosmetics and religious rituals is not surprising. A wide audience shares the fascination for Mother Earth’s generous bounty. Herbs have a long history and find a mention in ancient texts. Do herbal products have relevance in modern medicine, such as in the treatment of cancer, Alzheimer’s disease, diabetes, high blood pressure, obesity and so on? This book explores the historical, cultural, religious and scientific connection between the East and the West. With the author’s exposure to forestry training and research and knowledge drawn from the Bible, perhaps one of the biggest references for herbs, Holy Herbs stands at the right spot for tracing a global history of herbs from ancient to modern times.',
                'https://www.junkybooks.com/administrator/thebooks/63c10a247e483-handbook-of-medicinal-herbs.pdf'),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }

  GestureDetector books(
      String image, String bookdetails, String desc, String book_link) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReadPage(
                    image: image,
                    name: bookdetails,
                    desc: desc,
                    rating: '4.5',
                    book_link: book_link,
                    isBookmarked: false)));
      },
      child: Container(
        width: 170,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Image.network(
              image,
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(
                bookdetails,
                // "\nVedas, Upanishads & Puranas\nPRICE : 470",
                style:
                    GoogleFonts.exo(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
