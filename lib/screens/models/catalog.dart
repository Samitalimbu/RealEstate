class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: " My Luxury House",
        desc:
            "A house with a beautiful balcony plus \n with a good facility of everything",
        price: 290000000,
        image: "assets/images/house_Card2.jpeg"),
    Item(
        id: 1,
        name: " My Luxury House",
        desc:
            "A house with a beautiful balcony plus \n with a good facility of everything",
        price: 390000000,
        image: "assets/images/house_Card2.jpeg"),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image});
}
