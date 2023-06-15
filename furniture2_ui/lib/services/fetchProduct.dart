import 'dart:convert';
import 'package:furniture2_ui/models/Product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/products";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<Product> products = (jsonDecode(response.body) as List)
        .map((data) => Product.formJson(data))
        .toList();

    return products;
  } else {
    throw Exception('Fail to load data');
  }
}
