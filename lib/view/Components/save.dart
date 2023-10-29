import 'package:college_project/view/const/color.dart';
import 'package:college_project/Controller/book.dart';
import 'package:college_project/model/routes/read.dart';
import 'package:college_project/Controller/provider.dart';
import 'package:college_project/view/const/icon_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

class SavedBooksPage extends StatefulWidget {
  @override
  State<SavedBooksPage> createState() => _SavedBooksPageState();
}

class _SavedBooksPageState extends State<SavedBooksPage> {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "SAVED BOOKS 🔖",
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
                Icons.more_vert,
                color: colorPallateright,
                size: 27,
              ),
            ),
          )
        ],
      ),
      body: bookProvider.bookmarks.isEmpty == true
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'asset/nobook.png',
                    height: 300,
                    width: 250,
                  ),
                  Text(
                    "NO BOOK SAVED YET\n",
                    style: GoogleFonts.exo(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: bookProvider.bookmarks.length,
              itemBuilder: (context, index) {
                final book = bookProvider.bookmarks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadPage(
                          image: book.image,
                          name: book.name,
                          desc: book.desc,
                          rating: book.rating,
                          book_link: book.bookLink,
                          isBookmarked: book.isBookmarked,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                      contentPadding:
                          EdgeInsets.only(left: 20, right: 10, top: 10),
                      title: Text(book.name),
                      subtitle: Text("⭐" + book.rating),
                      leading: Container(
                          height: 120,
                          width: 40,
                          child: Image.network(
                            book.image,
                            fit: BoxFit.cover,
                          )),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                final url = Uri.parse(book.bookLink);
                                launchUrl(
                                  mode: LaunchMode.externalApplication,
                                  url,
                                );
                              },
                              icon: Icon(Icons.download),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  bookProvider.removeBookmark(Book(
                                    name: book.name,
                                    desc: book.desc,
                                    image: book.image,
                                    rating: book.rating,
                                    bookLink: book.bookLink,
                                    isBookmarked: book.isBookmarked,
                                  ));
                                });
                              },
                              icon: Icon(Icons.delete),
                            )
                          ],
                        ),
                      )),
                );
              },
            ),
    );
  }
}
