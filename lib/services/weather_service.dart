import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

import 'package:lua/models/weather_model.dart';

class WeatherService {
//   Function to fetch weather from API
Future<WeatherModel> fetchWeather() async {
  final url = Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=0.3476&longitude=32.5825&current_weather=true"
  );
//   send http get request
final response = await http.get(url);

if(response.statusCode == 200) {
  final data = jsonDecode(response.body);

//   Convert Map -> WeatherModel
  return WeatherModel.fromjson(data);
} else {
  throw Exception('Failed to load!');
}
}
}