import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/health_entry.dart';
import '../utils/constants.dart';

class ApiService {
  // Future<List<HealthEntry>> fetchItems() async {
  //   const String endPoint = 'get/';
  //   final response = await http.get(Uri.parse('$_baseUrl/$endPoint'));

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.body);
  //     print(data);

  //     return data.map((json) => HealthEntry().empty()).toList();
  //   } else {
  //     throw Exception('Failed to load items');
  //   }
  // }

  static fetchServerTest() async {
    const String endPoint = 'api/v1/quotes/random';
    final response = await http.get(Uri.parse('$API_BASE_URL/$endPoint'));

    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print(data);
    } else {
      throw Exception('Failed to load items');
    }
  }
}
