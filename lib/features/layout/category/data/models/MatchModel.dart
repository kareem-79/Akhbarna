class MatchModel {
  final String? id;
  final String? homeTeam;
  final String? homeTeamLogo;
  final int? homeScore;
  final String? awayTeam;
  final String? awayTeamLogo;
  final int? awayScore;
  final String? league;
  final String? date;
  final String? time;
  final String? status;
  final bool? isFinished;
  final bool? isLive;

  MatchModel({
    this.id,
    this.homeTeam,
    this.homeTeamLogo,
    this.homeScore,
    this.awayTeam,
    this.awayTeamLogo,
    this.awayScore,
    this.league,
    this.date,
    this.time,
    this.status,
    this.isFinished,
    this.isLive,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json["id"],
      homeTeam: json["homeTeam"],
      homeTeamLogo: json["homeTeamLogo"],
      homeScore: json["homeScore"],
      awayTeam: json["awayTeam"],
      awayTeamLogo: json["awayTeamLogo"],
      awayScore: json["awayScore"],
      league: json["league"],
      date: json["date"],
      time: json["time"],
      status: json["status"],
      isFinished: json["isFinished"],
      isLive: json["isLive"],
    );
  }
}