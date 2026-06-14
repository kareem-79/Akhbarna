import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/resources/constant.dart';
import '../models/CategoriesResponseModel.dart';
import 'category_remote_data_source.dart';

@Singleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: NewsApiConstant.baseUrl));

  @override
  Future<CategoriesResponseModel> getCategoryNews() async {
    try {
      final response = await dio.get(NewsApiConstant.byCategory);

      return CategoriesResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data["message"];
      }

      throw RemoteException(message: message ?? "Failed to load category news");
    }
  }
}
