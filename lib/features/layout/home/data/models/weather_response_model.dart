import 'WeatherLocationModel.dart';
import 'current_weather_model.dart';

class WeatherResponseModel {
  final WeatherLocationModel location;
  final CurrentWeatherModel current;

  WeatherResponseModel({required this.location, required this.current});

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      location: WeatherLocationModel.fromJson(json["location"]),
      current: CurrentWeatherModel.fromJson(json["current"]),
    );
  }
}
