class Book {
  final String name;
  final String desc;
  final String image;
  final String rating;
  final String bookLink;
  bool isBookmarked;

  Book({
    required this.name,
    required this.desc,
    required this.image,
    required this.rating,
    required this.bookLink,
    required this.isBookmarked,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? '',
      bookLink: json['bookLink'] ?? '',
      isBookmarked: json['isBookmarked'] ?? true,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'desc': desc,
      'image': image,
      'rating': rating,
      'bookLink': bookLink,
    };
  }
}
