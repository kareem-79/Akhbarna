import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/weather_response_model.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponseModel>> getCurrentWeather({
    required double lat,
    required double lng,
    required String lang,
  });
}
