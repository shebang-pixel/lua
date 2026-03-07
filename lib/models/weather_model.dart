class WeatherModel {
//   Defines how API data will look in our app
final double temperature;
final double windspeed;

// Constructor
WeatherModel({
    required this.temperature,
    required this.windspeed
});

// Convert Api json -> dart obj
factory WeatherModel.fromjson(Map<String,dynamic> json){
  return WeatherModel(
      temperature: json['current_weather']['temperature'],
      windspeed: json['current_weather']['windspeed']
  );
}
}