import 'package:college_project/view/const/color.dart';
import 'package:college_project/Controller/book.dart';
import 'package:college_project/Controller/provider.dart';
import 'package:college_project/view/const/icon_color.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadPage extends StatefulWidget {
  final String image;
  final String name;
  final String desc;
  final String rating;
  final String book_link;
  bool isBookmarked;

  ReadPage({
    required this.image,
    required this.name,
    required this.desc,
    required this.rating,
    required this.book_link,
    required this.isBookmarked,
  });

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  // bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    bookProvider.bookmarks.contains(Book(
      name: widget.name,
      desc: widget.desc,
      image: widget.image,
      rating: widget.rating,
      bookLink: widget.book_link,
      isBookmarked: widget.isBookmarked,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: shading_color(
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "STUDY PAGE",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                if (widget.isBookmarked) {
                  // Remove the book from bookmarks
                  bookProvider.removeBookmark(Book(
                    name: widget.name,
                    desc: widget.desc,
                    image: widget.image,
                    rating: widget.rating,
                    bookLink: widget.book_link,
                    isBookmarked: widget.isBookmarked,
                  ));
                } else {
                  // Add the book to bookmarks
                  bookProvider.addBookmark(Book(
                    name: widget.name,
                    desc: widget.desc,
                    image: widget.image,
                    rating: widget.rating,
                    bookLink: widget.book_link,
                    isBookmarked: widget.isBookmarked,
                  ));
                }
                setState(() {
                  widget.isBookmarked = !widget.isBookmarked;
                });
              },
              child: ShaderMask(
                shaderCallback: (Rect bounds) => RadialGradient(
                  center: Alignment.bottomRight,
                  stops: [.3, 1],
                  colors: [colorPallateright, colorPallateleft],
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: Icon(
                  widget.isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color.fromARGB(255, 239, 247, 250),
                child: Stack(
                  children: [
                    Center(
                        child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    )),
                    // Image(
                    //   // image: AssetImage('asset/feature4.png'),
                    //   image : widget.image,
                    // ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LikeButton(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                // 'Ramadan Kareem',
                widget.name,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Text('By E-Library'),
              SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rating',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text('Pages',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  Text('Language',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '⭐ ${widget.rating}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text('450',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  Text('ENG/Others',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              ReadMoreText(
                widget.desc,
                // 'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. ',
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: colorPallateright),
                lessStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: colorPallateright),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GradientText(
                        '\$00.00',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 30, 84, 109),
                            fontSize: 20),
                        colors: [colorPallateleft, colorPallateright],
                      ),
                      GestureDetector(
                        onTap: () {
                          final url = Uri.parse(widget.book_link);
                          launchUrl(
                            mode: LaunchMode.externalApplication,
                            url,
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              gradient: LinearGradient(colors: [
                                colorPallateleft,
                                colorPallateright
                              ])),
                          child: Center(
                            child: Text('Read Now',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
