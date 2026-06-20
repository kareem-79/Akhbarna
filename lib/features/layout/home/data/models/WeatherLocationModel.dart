class WeatherLocationModel {
  final String? name;
  final String? country;
  final String? localtime;

  WeatherLocationModel({
    this.name,
    this.country,
    this.localtime,
  });

  factory WeatherLocationModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return WeatherLocationModel(
      name: json["name"],
      country: json["country"],
      localtime: json["localtime"],
    );
  }
}