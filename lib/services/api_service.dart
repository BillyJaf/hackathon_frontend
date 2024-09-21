import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/health_entry.dart';
import '../utils/constants.dart';

class ApiService {
  static submitHealthEntrys(List<HealthEntry> entries) async {
    const String endPoint = 'serverdata/';
    final Uri url = Uri.parse("$API_BASE_URL/$endPoint");

    int entriesLength = entries.length;
    print("Submitting $entriesLength health entries to backend");

    // Send the POST request`
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Specify the content type if sending JSON data
        },
        body:
            jsonEncode(entries), // Convert the requestBody map to a JSON string
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Request was successful
        HealthEntry healthEntry = HealthEntry.fromJson(jsonDecode(response.body));
        print('Response: ${healthEntry}');
      } else {
        // Handle the error
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur
      print('Error: $e');
    }
  }
}
