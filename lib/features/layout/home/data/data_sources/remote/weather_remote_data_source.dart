import '../../models/weather_response_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponseModel> getCurrentWeather({
    required double lat,
    required double lng,
    required String lang,
  });
}