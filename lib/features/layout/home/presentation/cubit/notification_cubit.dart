import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/delete_all_notification_use_case.dart';
import '../../domain/use_case/delete_notification_use_case.dart';
import '../../domain/use_case/get_notification_use_case.dart';
import '../../domain/use_case/mark_notification_as_read_use_case.dart';
import 'state/notification_state.dart';

@lazySingleton
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationUseCase getNotificationUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;
  final DeleteNotificationUseCase deleteNotificationUseCase;
  final DeleteAllNotificationsUseCase deleteAllNotificationsUseCase;

  NotificationCubit({
    required this.getNotificationUseCase,
    required this.markNotificationAsReadUseCase,
    required this.deleteNotificationUseCase,
    required this.deleteAllNotificationsUseCase,
  }) : super(NotificationInitial());

  Future<void> getNotifications() async {
    emit(NotificationLoading());

    final result = await getNotificationUseCase();

    result.fold(
          (failure) {
        emit(NotificationError(message: failure.message));
      },
          (notifications) {
        emit(NotificationSuccess(notifications: notifications));
      },
    );
  }

  Future<void> markAsRead(String id) async {
    final result = await markNotificationAsReadUseCase(id);

    result.fold(
          (failure) {
        emit(NotificationError(message: failure.message));
      },
          (_) {
        if (state is NotificationSuccess) {
          final currentState = state as NotificationSuccess;

          final updatedNotifications = currentState.notifications.map((e) {
            if (e.id == id) {
              return e.copyWith(isRead: true);
            }
            return e;
          }).toList();

          emit(NotificationSuccess(notifications: updatedNotifications));
        }
      },
    );
  }

  Future<void> deleteNotification(String id) async {
    final result = await deleteNotificationUseCase(id);

    result.fold(
          (failure) {
        emit(NotificationError(message: failure.message));
      },
          (_) {
        if (state is NotificationSuccess) {
          final currentState = state as NotificationSuccess;

          final updatedNotifications = currentState.notifications
              .where((e) => e.id != id)
              .toList();

          emit(NotificationSuccess(notifications: updatedNotifications));
        }
      },
    );
  }

  Future<void> deleteAllNotifications() async {
    final result = await deleteAllNotificationsUseCase();

    result.fold(
          (failure) {
        emit(NotificationError(message: failure.message));
      },
          (_) {
        emit(NotificationSuccess(notifications: []));
      },
    );
  }
}