import 'package:akhbarna/features/layout/home/data/models/ArticleModel.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constant.dart';
import 'home_remote_data_source.dart';

@Singleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: NewsApiConstant.baseUrl));
  @override
  Future<List<ArticleModel>> getBreakingNews() async {
    try {
      final response = await dio.get(NewsApiConstant.breakingNews);

      List data = response.data;

      return data.map((e) {
        return ArticleModel.fromJson(e);
      }).toList();
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data["message"];
      }

      throw RemoteException(message: message ?? "Failed to load breaking news");
    }
  }

  @override
  Future<List<ArticleModel>> getMostReadNews({required int top}) async {
    try {
      final response = await dio.get(
        NewsApiConstant.mostReadNews,

        queryParameters: {"top": top},
      );

      List data = response.data;

      return data.map((e) {
        return ArticleModel.fromJson(e);
      }).toList();
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data["message"];
      }
      throw RemoteException(
        message: message ?? "Failed to load most read news",
      );
    }
  }

  @override
  Future<List<ArticleModel>> getLatestNews({required int top}) async {
    try {
      final response = await dio.get(
        NewsApiConstant.topNews,

        queryParameters: {"top": top},
      );

      List data = response.data;

      return data.map((e) {
        return ArticleModel.fromJson(e);
      }).toList();
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data["message"];
      }

      throw RemoteException(message: message ?? "Failed to load latest news");
    }
  }

  @override
  Future<List<ArticleModel>> getTrendingNews({required int top}) async {
    try {
      final response = await dio.get(
        NewsApiConstant.trendingNews,
        queryParameters: {"top": top},
      );

      List data = response.data;

      return data.map((e) {
        return ArticleModel.fromJson(e);
      }).toList();
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data["message"];
      }

      throw RemoteException(message: message ?? "Failed to load trending news");
    }
  }
}
