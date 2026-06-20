import '../../../data/models/weather_response_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherResponseModel weather;

  WeatherSuccess({
    required this.weather,
  });
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({
    required this.message,
  });
}