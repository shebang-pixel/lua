import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherPage extends StatefulWidget{
  const WeatherPage({super.key});
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Instance of our API service
  final WeatherService service = WeatherService();

  // Future that will hold weather data
  late Future<WeatherModel> weatherFuture;

  @override
  void initState() {
    super.initState();
    // Call API when widget loads
    weatherFuture = service.fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Page'),),
      body: FutureBuilder<WeatherModel>(
        future: weatherFuture,
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (!snapshot.hasData) {
            return const Text("No weather data");
          }

          final weather = snapshot.data!;

          return Column(
            children: [
              Container(child: Text('City: Nairobi City')),
              Container(child: Text('Wind Speed: ${weather.windspeed}')),
              Container(child: Text('Tempurature: ${weather.temperature}')),
            ],
          );
        },
      ),
    );
  }
}