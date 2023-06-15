class Product {
  final int id, price;
  final String title, description, image, category;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
  });
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: 56,
    title: "Classic Leather Arm Chair",
    image: "assets/images/Item_1.png",
    description: description,
    category: "Sofa",
  ),
  Product(
    id: 4,
    price: 68,
    title: "Poppy Plastic Tub Chair",
    image: "assets/images/Item_2.png",
    description: description,
    category: "Park bench",
  ),
  Product(
    id: 9,
    price: 39,
    title: "Bar Stool Chair",
    image: "assets/images/Item_3.png",
    description: description,
    category: "Armchair",
  ),
];

final List<String> Category = [
  "All",
  "Sofa",
  "Park bench",
  "Armchair",
];

final description =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim";
