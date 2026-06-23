import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/repositories/matches_repository.dart';
import '../data_sources/match_remote_data_source.dart';
import '../models/MatchDayModel.dart';

@Singleton(as: MatchesRepository)
class MatchesRepositoryImpl implements MatchesRepository {
  final MatchesRemoteDataSource remoteDataSource;

  MatchesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MatchDayModel>>> getMatches() async {
    try {
      final response = await remoteDataSource.getMatches();

      return Right(response);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
