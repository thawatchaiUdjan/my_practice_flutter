class Product {
  final int price;
  final String id, title, category, image, subTitle, description;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.category,
    required this.image,
    required this.subTitle,
    required this.description,
  });

  factory Product.formJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      price: json["price"],
      title: json["title"],
      category: json["category"],
      image: json["image"],
      subTitle: json["subTitle"],
      description: json["description"],
    );
  }
}

//demo product
Product product = Product(
  id: "1",
  price: 150,
  title: "Wood Frame",
  image: "https://i.imgur.com/sI4GvE6.png",
  category: "Chair",
  subTitle: "Taeton Armchair",
  description: description,
);

String description =
    "This armchair is an elegant and funtional price of furniture. It is suitable for faming.";
