class Book {
  final String title;
  final String detail;
  final String rating;
  final String location;
  final String imageUrl;

  Book({
    required this.detail,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.title,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        detail: json['detail'],
        imageUrl: json['imageUrl'],
        rating: json['rating'],
        title: json['title'],
        location: json['location']);
  }
  @override
  String toString() {
    return 'Book('
        'imageUrl: $imageUrl,'
        'title:$title,'
        ')';
  }
}

List<Book> books = [
  Book(
      detail:
          "Home is where love resides, memories are created, friends always belong, and laughter never ends.",
      imageUrl: "assets/images/House1.jpg",
      rating: "*****",
      location: "Kathmandu",
      title: "A luxury House"),
  Book(
      detail:
          "Home is where love resides, memories are created, friends always belong, and laughter never ends.",
      imageUrl: "assets/images/House2.jpg",
      rating: "*****",
      location: "Baneshwor",
      title: " A house environment"),
  Book(
      detail:
          "Home is where love resides, memories are created, friends always belong, and laughter never ends.",
      imageUrl: "assets/images/House3.jpg",
      rating: "*****",
      location: "Boudha",
      title: "Good House with good furniture"),
];
