import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../repositories/notification_repository.dart';

@injectable
class DeleteNotificationUseCase {
  final NotificationRepository repository;

  DeleteNotificationUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(String id) {
    return repository.deleteNotification(id);
  }
}
