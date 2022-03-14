import 'dart:convert';
import 'dart:io';

import 'package:weather_app_update/domain/json_to_dart/coords.dart';
import 'package:weather_app_update/domain/json_to_dart/weather_data.dart';

// api.openweathermap.org/data/2.5/weather?q=London&appid=26bdae36dcd7235799a31dae46df0f3d
// api.openweathermap.org/data/2.5/onecall?lat=55.7522&lon=37.6156&exclude=hourly,minutely&appid=49cc8c821cd2aff9af04c9f98c36eb74
// https://api.openweathermap.org/data/2.5/onecall?lon=37.6156&lat=55.7522&exclude=hourly,minutely&appid=49cc8c821cd2aff9af04c9f98c36eb74

class WeatherApi {
  WeatherApi._();
  static final _client = HttpClient();
  static const String _apiKey = '26bdae36dcd7235799a31dae46df0f3d';
  static const String _host = 'api.openweathermap.org';

  static Future<Coords?> getCoords(String cityName) async {
    const path = 'data/2.5/weather';
    Uri url = Uri(
      scheme: 'https',
      host: _host,
      path: path,
      queryParameters: {
        'q': cityName,
        'lang': 'ru',
        'appid': _apiKey,
      },
    );

    try {
      final data = await _jsonRequest(url);
      final coords = Coords.fromJson(data);
      return coords;
    } catch (e) {
      
      url = Uri(
        scheme: 'https',
        host: _host,
        path: path,
        queryParameters: {
          'q': 'Ташкент',
          'lang': 'ru',
          'appid': _apiKey,
        },
      );

      final data = await _jsonRequest(url);
      final coords = Coords.fromJson(data);
      return coords;
    }
  }

  static Future<WeatherData?> getWeather(Coords? coords) async {
    if (coords != null) {
      const path = 'data/2.5/onecall';

      final url = Uri(
        scheme: 'https',
        host: _host,
        path: path,
        queryParameters: {
          'appid': _apiKey,
          'lat': coords.lat.toString(),
          'lon': coords.lon.toString(),
          'lang': 'ru',
          'exclude': 'hourly,minutely',
        },
      );

      final data = await _jsonRequest(url);
      final weatherData = WeatherData.fromJson(data);

      return weatherData;
    }
    return null;
  }

  static Future<Map<String, dynamic>> _jsonRequest(Uri url) async {
    final request = await _client.getUrl(url);
    final response = await request.close();

    final json = await response.transform(utf8.decoder).toList();
    final jsonString = json.join();

    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    return data;
  }
}
