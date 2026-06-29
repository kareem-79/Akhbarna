import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/errors/app_exception.dart';
import '../../../../../../core/resources/constant.dart';
import '../../../../../auth/register/data/data_sources/local/auth_local_data_source.dart';
import '../../models/notification_model.dart';
import 'notification_remote_data_source.dart';

@Singleton(as: NotificationRemoteDataSource)
class NotificationApiRemoteDataSource implements NotificationRemoteDataSource {
  final AuthLocalDataSource authLocalDataSource;

  NotificationApiRemoteDataSource({required this.authLocalDataSource});

  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final token = await authLocalDataSource.getToken();

      final response = await dio.get(
        ApiConstant.notificationsEndpoint,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
          validateStatus: (_) => true,
        ),
      );

      if (response.statusCode == 204) {
        return [];
      }

      if (response.statusCode != 200) {
        throw RemoteException(message: "Failed to load notifications");
      }

      if (response.data is! List) {
        return [];
      }

      return (response.data as List)
          .map((e) => NotificationModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      String message = "Failed to load notifications";

      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data["message"] ?? message;
      }

      throw RemoteException(message: message);
    }
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    try {
      final token = await authLocalDataSource.getToken();

      await dio.post(
        "${ApiConstant.notificationsEndpoint}/read/$notificationId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      String message = "Failed to mark notification as read";

      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data["message"] ?? message;
      }

      throw RemoteException(message: message);
    }
  }

  @override
  Future<void> deleteNotification(String id) async {
    try {
      final token = await authLocalDataSource.getToken();

      await dio.delete(
        "${ApiConstant.notificationsEndpoint}/$id",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      String message = "Failed to delete notification";

      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data["message"] ?? message;
      }

      throw RemoteException(message: message);
    }
  }

  @override
  Future<void> deleteAllNotifications() async {
    try {
      final token = await authLocalDataSource.getToken();

      await dio.delete(
        ApiConstant.deleteAllNotifications,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
    } on DioException catch (e) {
      String message = "Failed to delete notifications";

      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data["message"] ?? message;
      }

      throw RemoteException(message: message);
    }
  }
}
