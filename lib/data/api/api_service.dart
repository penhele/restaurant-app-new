import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/restaurant_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load restaurant list");
    }
  }
}
