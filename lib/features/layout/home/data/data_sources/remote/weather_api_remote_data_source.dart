import 'package:akhbarna/core/resources/constant.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/errors/app_exception.dart';
import '../../models/weather_response_model.dart';
import 'weather_remote_data_source.dart';

@Singleton(as: WeatherRemoteDataSource)
class WeatherApiRemoteDataSource implements WeatherRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: NewsApiConstant.weatherBaseUrl));

  @override
  Future<WeatherResponseModel> getCurrentWeather({
    required double lat,
    required double lng,
    required String lang,
  }) async {
    try {
      final response = await dio.get(
        NewsApiConstant.currentWeather,
        queryParameters: {
          "key": NewsApiConstant.weatherApiKey,
          "q": "$lat,$lng",
          "lang": lang,
        },
      );
      return WeatherResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data["error"]?["message"];
      }

      throw RemoteException(message: message ?? "Failed to load weather");
    }
  }
}
