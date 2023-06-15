class Category {
  final String id, title, image;
  final int numOfProducts;

  Category({
    required this.id,
    required this.title,
    required this.image,
    required this.numOfProducts,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"],
    );
  }
}

//demo product
Category category = Category(
  id: "1",
  title: "ArmChair",
  image: "https://i.imgur.com/JqKDdxj.png",
  numOfProducts: 150,
);