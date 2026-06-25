import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constant.dart';
import '../../../../../auth/register/data/data_sources/local/auth_local_data_source.dart';
import '../../models/book_market_request.dart';
import 'book_market_remote_data_source.dart';

@Singleton(as: SavedRemoteDataSource)
class SavedApiRemoteDataSource implements SavedRemoteDataSource {
  final AuthLocalDataSource authLocalDataSource;

  SavedApiRemoteDataSource({
    required this.authLocalDataSource,
  });

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: NewsApiConstant.baseUrlSavedArticle,
    ),
  );

  @override
  Future<void> saveArticle({
    required SaveArticleRequestModel request,
  }) async {
    try {
      final token = await authLocalDataSource.getToken();

      final options = Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "*/*",
        },
      );

      await dio.post(
        NewsApiConstant.savedArticle,
        data: request.toJson(),
        options: options,
      );
    } on DioException catch (exception) {
      String message = "Failed to save article";

      final data = exception.response?.data;

      if (data is Map<String, dynamic>) {
        message = data["message"] ?? message;
      } else if (data is String && data.isNotEmpty) {
        message = data;
      }

      throw RemoteException(message: message);
    } catch (e) {
      throw RemoteException(message: e.toString());
    }
  }
}
