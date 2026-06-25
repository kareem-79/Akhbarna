import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  )
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );

  @override
  Future<void> saveArticle({
    required SaveArticleRequestModel request,
  }) async {
    try {
      final token = await authLocalDataSource.getToken();

      debugPrint("====================================");
      debugPrint("URL => ${dio.options.baseUrl}${NewsApiConstant.savedArticle}");
      debugPrint("TOKEN => $token");
      debugPrint("REQUEST => ${request.toJson()}");

      final options = Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "*/*",
        },
      );

      debugPrint("HEADERS => ${options.headers}");

      final response = await dio.post(
        NewsApiConstant.savedArticle,
        data: request.toJson(),
        options: options,
      );

      debugPrint("STATUS => ${response.statusCode}");
      debugPrint("BODY => ${response.data}");
      debugPrint("====================================");
    } on DioException catch (exception) {
      debugPrint("====================================");
      debugPrint("URL => ${exception.requestOptions.uri}");
      debugPrint("STATUS => ${exception.response?.statusCode}");
      debugPrint("HEADERS => ${exception.requestOptions.headers}");
      debugPrint("BODY => ${exception.response?.data}");
      debugPrint("TYPE => ${exception.response?.data.runtimeType}");
      debugPrint("ERROR => ${exception.message}");
      debugPrint("====================================");

      String message = "Failed to save article";

      final data = exception.response?.data;

      if (data is Map<String, dynamic>) {
        message = data["message"] ?? message;
      } else if (data is String && data.isNotEmpty) {
        message = data;
      }

      throw RemoteException(message: message);
    } catch (e) {
      debugPrint("UNKNOWN ERROR => $e");
      throw RemoteException(message: e.toString());
    }
  }
}