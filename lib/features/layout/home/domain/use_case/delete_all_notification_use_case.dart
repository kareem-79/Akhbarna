import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../repositories/notification_repository.dart';

@injectable
class DeleteAllNotificationsUseCase {
  final NotificationRepository repository;

  DeleteAllNotificationsUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() {
    return repository.deleteAllNotifications();
  }
}
