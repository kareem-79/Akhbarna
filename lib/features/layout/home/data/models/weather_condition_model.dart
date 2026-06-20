class WeatherConditionModel {
  final String? text;
  final String? icon;

  WeatherConditionModel({
    this.text,
    this.icon,
  });

  factory WeatherConditionModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return WeatherConditionModel(
      text: json["text"],
      icon: json["icon"],
    );
  }
}