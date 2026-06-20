import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/weather_response_model.dart';
import '../repositories/weather_repository.dart';

@injectable
class GetCurrentWeatherUseCase {
  final WeatherRepository repository;

  GetCurrentWeatherUseCase({required this.repository});

  Future<Either<Failure, WeatherResponseModel>> call({
    required double lat,
    required double lng,
    required String lang,
  }) {
    return repository.getCurrentWeather(lat: lat, lng: lng, lang: lang);
  }
}
