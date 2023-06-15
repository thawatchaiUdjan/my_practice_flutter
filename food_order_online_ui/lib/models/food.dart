class Food {
  final String? title;
  final String? shopName;
  final String? category;
  final String? icon;
  final String? image;
  final int price;
  final double rating;
  final int reviews;
  final String description;

  Food({
    required this.title,
    required this.shopName,
    required this.category,
    required this.icon,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.description,
  });
}

final List<Food> foods = fooddata
    .map((item) => Food(
          title: item["title"],
          shopName: item["shopName"],
          category: item["category"],
          icon: item["icon"],
          image: item["image"],
          price: int.parse(item["price"].toString()),
          rating: double.parse(item["rating"].toString()),
          reviews: int.parse(item["reviews"].toString()),
          description: foodDescription,
        ))
    .toList();

final fooddata = [
  {
    "title": "Salad",
    "category": "food",
    "shopName": "Salad restaurant",
    "icon": "salad.png",
    "image": "salad_bg.jpg",
    "price": "14",
    "rating": "3",
    "reviews": "53",
  },
  {
    "title": "Chicken",
    "category": "chicken",
    "shopName": "MacDonald's",
    "icon": "chicken-leg.png",
    "image": "chicken_bg.jpg",
    "price": "10",
    "rating": "4",
    "reviews": "42"
  },
  {
    "title": "Orange Juice",
    "category": "beverages",
    "shopName": "100% Juice's",
    "icon": "orange-juice.png",
    "image": "orange_juice_bg.jpg",
    "price": "12",
    "rating": "3.5",
    "reviews": "67"
  },
  {
    "title": "Potato Chips",
    "category": "chip & snack",
    "shopName": "Makro's",
    "icon": "potato-chips.png",
    "image": "potato_chip_bg.jpg",
    "price": "13",
    "rating": "4.5",
    "reviews": "49"
  },
];

final foodCtg = [
  "All",
  "Food",
  "Chicken",
  "Beverages",
  "Chip & Snack",
];

final foodDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown";
