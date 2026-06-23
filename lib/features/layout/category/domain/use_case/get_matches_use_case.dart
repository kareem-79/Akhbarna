import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/MatchDayModel.dart';
import '../repositories/matches_repository.dart';

@injectable
class GetMatchesUseCase {
  final MatchesRepository repository;

  GetMatchesUseCase({required this.repository});

  Future<Either<Failure, List<MatchDayModel>>> call() {
    return repository.getMatches();
  }
}
