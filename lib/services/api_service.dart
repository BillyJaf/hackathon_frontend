import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/health_entry.dart';
import '../utils/constants.dart';

class ApiService {
  static Future<List<HealthEntry>> fetchServerTest() async {
    const String endPoint = 'serverdata/';
    final response = await http.get(Uri.parse('$API_BASE_URL/$endPoint'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print(data);
      
      // FIXME: convert data to HealthEntry objects
      return data.map((json) => HealthEntry.create_empty()).toList();
    } else {
      print('Failed to load data');

      // FIXME: some random data
      return [HealthEntry.create_empty(), HealthEntry.create_empty(), HealthEntry.create_empty()];
    }
  }
}
