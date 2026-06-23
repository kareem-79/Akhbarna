import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/MatchDayModel.dart';

abstract class MatchesRepository {
  Future<Either<Failure, List<MatchDayModel>>> getMatches();
}
