import 'dart:convert';
import 'package:furniture2_ui/models/Categories.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchCategory() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<Category> categorys = (jsonDecode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();

    return categorys;
  } else {
    throw Exception('Fail to load data');
  }
}
