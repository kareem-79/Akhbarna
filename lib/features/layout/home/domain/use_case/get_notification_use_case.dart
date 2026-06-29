import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/notification_model.dart';
import '../repositories/notification_repository.dart';

@injectable
class GetNotificationUseCase {
  final NotificationRepository repository;

  GetNotificationUseCase({required this.repository});

  Future<Either<Failure, List<NotificationModel>>> call() {
    return repository.getNotifications();
  }
}
