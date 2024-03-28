import 'dart:convert';
import 'package:http/http.dart' as http;

class BackendService {
  static const String baseUrl = 'https://predict-housing-prices.onrender.com'; 

  Future<dynamic> sendHouseData({
    required int bedroomCount,
    required double netSquare,
    required double centerDistance,
    required double metroDistance,
    required int floor,
    required int age,
  }) async {
    final Uri uri = Uri.parse('$baseUrl/predict');
    
    final Map<String, dynamic> requestData = {
      'bedroom_count': bedroomCount,
      'net_sqm': netSquare,
      'center_distance': centerDistance,
      'metro_distance': metroDistance,
      'floor': floor,
      'age': age,
    };

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        return jsonDecode(response.body);
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        return null; // or throw an exception if needed
      }
    } catch (e) {
      // Handle error
      print('Error: $e');
      return null; // or throw an exception if needed
    }
  }
}
