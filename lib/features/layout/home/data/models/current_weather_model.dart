import 'weather_condition_model.dart';

class CurrentWeatherModel {
  final double? tempC;
  final double? feelsLikeC;
  final int? humidity;
  final double? windKph;
  final WeatherConditionModel condition;

  CurrentWeatherModel({
    this.tempC,
    this.feelsLikeC,
    this.humidity,
    this.windKph,
    required this.condition,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      tempC: (json["temp_c"] as num?)?.toDouble(),
      feelsLikeC: (json["feelslike_c"] as num?)?.toDouble(),
      humidity: json["humidity"],
      windKph: (json["wind_kph"] as num?)?.toDouble(),
      condition: WeatherConditionModel.fromJson(json["condition"]),
    );
  }
}
