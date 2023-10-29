import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> bookContainer = [
  booksInfo(
    'https://m.media-amazon.com/images/I/61zQ9AhraGL._AC_UY327_FMwebp_QL65_.jpg',
    "Science & Technology",
    "john rich",
  ),
  booksInfo(
    'https://images-eu.ssl-images-amazon.com/images/I/51bh8Y3Si4L._AC_SX184_.jpg',
    "Space Encyclopedia",
    "by OM",
  ),
  booksInfo(
    'https://m.media-amazon.com/images/I/51bVNTqHFlL._AC_UY327_FMwebp_QL65_.jpg',
    "The Alchemist",
    "Penlo Coelho",
  ),
  booksInfo(
      'https://m.media-amazon.com/images/I/81Mks12En2L._AC_UY327_FMwebp_QL65_.jpg',
      "One in a Million",
      "Lindsey Kelk"),
  booksInfo(
    'https://images-eu.ssl-images-amazon.com/images/I/51XzsgxukvL._AC_SX184_.jpg',
    "Crime & Punishment",
    "Fyodor Dostoevsky",
  )
];
Column booksInfo(String image, String bookname, String authername) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 180,
          width: 140,
          margin: EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(
        bookname,
        style: GoogleFonts.exo(fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        authername,
        style: GoogleFonts.exo(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ],
  );
}
