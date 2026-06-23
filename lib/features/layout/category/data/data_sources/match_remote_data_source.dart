import '../models/MatchDayModel.dart';

abstract class MatchesRemoteDataSource {
  Future<List<MatchDayModel>> getMatches();
}