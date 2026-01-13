// test/weather_model_test.dart

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
// Make sure this import path correctly points to your Weather model file.
// You might need to adjust 'weather_app' to your actual project name.
import 'package:weather_app/models/weather.dart';

void main() {
  // Group of tests for the Weather model
  group('Weather.fromJson', () {
    // Test case to verify successful parsing of JSON
    test('should correctly parse a JSON object into a Weather model', () {
      // 1. ARRANGE: A realistic JSON sample from the OpenWeatherMap API for Manila, PH.
      const String realisticJsonSample = '''
      {
        "coord": {
          "lon": 120.98,
          "lat": 14.6
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04n"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 28.3,
          "feels_like": 32.8,
          "temp_min": 27.78,
          "temp_max": 28.3,
          "pressure": 1010,
          "humidity": 78
        },
        "visibility": 10000,
        "wind": {
          "speed": 2.57,
          "deg": 200
        },
        "clouds": {
          "all": 75
        },
        "dt": 1673556939,
        "sys": {
          "type": 1,
          "id": 8160,
          "country": "PH",
          "sunrise": 1673562095,
          "sunset": 1673602931
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      }
      ''';

      // Decode the JSON string into a Dart Map
      final Map<String, dynamic> jsonMap = json.decode(realisticJsonSample);

      // 2. ACT: Use the fromJson factory method to create a Weather object.
      final weatherModel = Weather.fromJson(jsonMap);

      // 3. ASSERT: Check that the Weather object was created with the correct data.
      expect(weatherModel, isA<Weather>());
      expect(weatherModel.city, 'Manila');
      expect(weatherModel.temperature, 28.3);
      expect(weatherModel.description, 'broken clouds');
      expect(weatherModel.humidity, 78);
      expect(weatherModel.windSpeed, 2.57);
    });
  });
}