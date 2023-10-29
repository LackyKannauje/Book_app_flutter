import 'dart:convert';
import 'package:college_project/Controller/book.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookProvider extends ChangeNotifier {
  List<Book> _bookmarks = [];
  List<Book> get bookmarks => _bookmarks;

  Future<void> init() async {
    await loadBookmarks();
  }
  Future<void> loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBookmarks = prefs.getStringList('bookmarks') ?? [];
    _bookmarks = savedBookmarks.map((jsonString) {
      final Map<String, dynamic> bookMap = json.decode(jsonString);
      return Book.fromJson(bookMap);
    }).toList();
    notifyListeners();
  }
  Future<void> saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarkStrings =
        _bookmarks.map((book) => json.encode(book.toJson())).toList();
    await prefs.setStringList('bookmarks', bookmarkStrings);
  }
  void addBookmark(Book book) {
    _bookmarks.removeWhere((bk) =>
        bk.name == book.name &&
        bk.desc == book.desc &&
        bk.rating == book.rating &&
        bk.bookLink == book.bookLink);
    _bookmarks.add(book);
    saveBookmarks(); // Save the updated bookmarks list
    notifyListeners();
  }
  void removeBookmark(Book book) {
    _bookmarks.removeWhere((b) =>
        b.name == book.name &&
        b.desc == book.desc &&
        b.rating == book.rating &&
        b.bookLink == book.bookLink);
    saveBookmarks(); // Save the updated bookmarks list
    notifyListeners();
  }
}
