import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  // search controller
  final TextEditingController _searchController = TextEditingController();

  // all forecast data
  final List<Map<String, String>> forecasts = [
    {"city": "Moscow", "weather": "Sunny and Cloudy", "temp": "18°C"},
    {"city": "Shiganshina", "weather": "Sunny and Cloudy", "temp": "15°C"},
    {"city": "Nairobi", "weather": "Sunny", "temp": "22°C"},
    {"city": "Tokyo", "weather": "Rainy", "temp": "17°C"},
  ];

  // filtered list
  List<Map<String, String>> filtered = [];

  @override
  void initState() {
    super.initState();
    filtered = forecasts;
  }

  // search function
  void searchCity(String query) {
    setState(() {
      filtered = forecasts
          .where((city) =>
          city["city"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Weather"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// 🔎 Search Bar
            TextField(
              controller: _searchController,
              onChanged: searchCity,

              decoration: InputDecoration(
                hintText: "Search city...",
                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Current Weather Card
            currentWeatherCard(),

            const SizedBox(height: 24),

            /// Forecast List
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,

                itemBuilder: (context, index) {

                  final city = filtered[index];

                  return forecastTile(
                    city["city"]!,
                    city["weather"]!,
                    city["temp"]!,
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  /// Current Weather UI
  Widget currentWeatherCard() {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          )
        ],
      ),

      child: Row(
        children: [

          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://placehold.co/600x400',
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "Nairobi",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  "Sunny and Cloudy",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 8),

                Text(
                  "18°C",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

/// Forecast Tile Widget
Widget forecastTile(String city, String weather, String temp) {

  return Container(

    margin: const EdgeInsets.only(bottom: 12),

    padding: const EdgeInsets.all(16),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 6,
        )
      ],
    ),

    child: Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              city,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            Text(
              weather,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),

        Text(
          temp,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )

      ],
    ),
  );
}