import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/resources/constant.dart';
import '../models/MatchDayModel.dart';
import 'match_remote_data_source.dart';

@Singleton(as: MatchesRemoteDataSource)
class MatchesApiRemoteDataSource implements MatchesRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: NewsApiConstant.matchBaseUrl));

  @override
  Future<List<MatchDayModel>> getMatches() async {
    try {
      final response = await dio.get(NewsApiConstant.match);
      List data = response.data;

      return data.map((e) => MatchDayModel.fromJson(e)).toList();
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data["message"];
      }

      throw RemoteException(message: message ?? "Failed to load matches");
    }
  }
}
