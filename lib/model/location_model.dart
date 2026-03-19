class LocationModel {
  final String name;
  final String flag;

  const LocationModel({
    required this.name,
    required this.flag,
  });

  static const List<LocationModel> locations = [
    LocationModel(name: "Egypt", flag: "🇪🇬"),
    LocationModel(name: "Saudi Arabia", flag: "🇸🇦"),
    LocationModel(name: "United Arab Emirates", flag: "🇦🇪"),
    LocationModel(name: "Kuwait", flag: "🇰🇼"),
    LocationModel(name: "Qatar", flag: "🇶🇦"),
    LocationModel(name: "Morocco", flag: "🇲🇦"),
    LocationModel(name: "Algeria", flag: "🇩🇿"),
    LocationModel(name: "Tunisia", flag: "🇹🇳"),
    LocationModel(name: "Argentina", flag: "🇦🇷"),
    LocationModel(name: "Turkey", flag: "🇹🇷"),
    LocationModel(name: "Germany", flag: "🇩🇪"),
    LocationModel(name: "United States", flag: "🇺🇸"),
    LocationModel(name: "France", flag: "🇫🇷"),
    LocationModel(name: "Spain", flag: "🇪🇸"),
    LocationModel(name: "Japan", flag: "🇯🇵"),
  ];
}