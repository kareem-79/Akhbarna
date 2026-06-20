import 'package:akhbarna/features/layout/home/data/data_sources/remote/weather_remote_data_source.dart';
import 'package:akhbarna/features/layout/home/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../models/weather_response_model.dart';

@Singleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherResponseModel>> getCurrentWeather({
    required double lat,
    required double lng,
    required String lang,
  }) async {
    try {
      final response = await remoteDataSource.getCurrentWeather(
        lat: lat,
        lng: lng,
        lang: lang,
      );
      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
