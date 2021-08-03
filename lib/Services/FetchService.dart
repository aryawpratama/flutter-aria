import 'package:dicoding_flutter/Model/Detail.model.dart';
import 'package:http/http.dart' as http;
import 'package:dicoding_flutter/Model/Restaurants.model.dart';

class FetchService {
  static const String url = 'https://restaurant-api.dicoding.dev/';

  static Future getRestaurant() async {
    final respose = await http.get(Uri.parse(url + "list"));
    if (respose.statusCode == 200) {
      final restaurant = restaurantFromJson(respose.body);
      return restaurant;
    }
  }

  static Future getDetail(String id) async {
    final response = await http.get(Uri.parse(url + "detail/$id"));
    if (response.statusCode == 200) {
      final detailRestaurant = detailRestaurantFromJson(response.body);
      return detailRestaurant;
    }
  }
}
