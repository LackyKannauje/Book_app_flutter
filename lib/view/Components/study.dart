import 'dart:convert';
import 'package:college_project/model/routes/read.dart';
import 'package:college_project/view/const/color.dart';
import 'package:college_project/view/const/icon_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class StudyPage extends StatefulWidget {
  String search;
  StudyPage({required this.search});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  void initState() {
    super.initState();
    _searchBooks();
  }

  List<dynamic> searchResults = [];

  Future<void> _searchBooks() async {
    try {
      final url =
          'https://openlibrary.org/search.json?q=${Uri.encodeQueryComponent(widget.search)}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          searchResults = jsonResponse['docs'];
        });
      } else {
        print("No book available");
      }
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "STUDY BOOKS 📚",
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
                  Icons.folder_special_outlined,
                  color: colorPallateright,
                  size: 27,
                ),
              ),
            )
          ],
        ),
        body: searchResults.isEmpty
            ? Center(child: Image.asset('asset/bookreload.gif'))
            : ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  final book = searchResults[index];
                  final title = book['title'];
                  final author = book['author_name'].join(', ');
                  final imageUrl = book['cover_i'] != null
                      ? 'https://covers.openlibrary.org/b/id/${book['cover_i']}-M.jpg'
                      : 'URL to a default image if cover_i is not available';
                  final description = book['description'] ?? "description";
                  return ListTile(
                    leading: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                    title: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ReadPage(
                                image: imageUrl,
                                name: title,
                                desc: description,
                                rating: "4.5",
                                book_link: 'book_link',
                                isBookmarked: false),
                          ),
                        );
                      },
                      child: Text(title),
                    ),
                    subtitle: Text(author),
                  );
                },
              ));
  }
}
