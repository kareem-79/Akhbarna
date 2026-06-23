import 'MatchModel.dart';
class MatchDayModel {
  final String? label;
  final String? dateLabel;
  final List<MatchModel> matches;

  MatchDayModel({
    this.label,
    this.dateLabel,
    required this.matches,
  });

  factory MatchDayModel.fromJson(Map<String, dynamic> json) {
    return MatchDayModel(
      label: json["label"],
      dateLabel: json["dateLabel"],
      matches: (json["matches"] as List<dynamic>)
          .map((e) => MatchModel.fromJson(e))
          .toList(),
    );
  }
}