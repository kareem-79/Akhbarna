import 'package:akhbarna/features/layout/home/presentation/cubit/state/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_case/get_current_weather_use_case.dart';

@lazySingleton
class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;

  WeatherCubit({required this.getCurrentWeatherUseCase})
      : super(WeatherInitial());

  Future<void> getCurrentWeather({
    required double lat,
    required double lng,
    required String lang,
  }) async {
    emit(WeatherLoading());

    final result = await getCurrentWeatherUseCase(
      lat: lat,
      lng: lng,
      lang: lang,
    );


    result.fold(
          (failure) {
        emit(WeatherError(message: failure.message));
      },
          (weather) {
        emit(WeatherSuccess(weather: weather));
      },
    );
  }
}
