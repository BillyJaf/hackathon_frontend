import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/health_entry.dart';
import '../utils/constants.dart';

class ApiService {
  static Future<HealthEntry?> submitHealthEntries(List<HealthEntry> entries) async {
    const String endPoint = 'serverdata/';
    final Uri url = Uri.parse("$API_BASE_URL/$endPoint");

    // Send the POST request`
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Specify the content type if sending JSON data
        },
        body: jsonEncode(entries), // Convert the requestBody map to a JSON string
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Request was successful
        HealthEntry healthEntry = HealthEntry.fromJson(jsonDecode(response.body));
        return healthEntry;
      } else {
        // Handle the error
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur
      print('Error: $e');
    }

    return null;
  }
}
