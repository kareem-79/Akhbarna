class LanguageModel {
  final String name;
  final String flag;

  const LanguageModel({required this.name, required this.flag});

  static const List<LanguageModel> languages = [
    LanguageModel(name: "العربية (مصر)", flag: "🇪🇬"),
    LanguageModel(name: "العربية (السعودية)", flag: "🇸🇦"),
    LanguageModel(name: "العربية (الإمارات)", flag: "🇦🇪"),
    LanguageModel(name: "English", flag: "🇬🇧"),
    LanguageModel(name: "Spanish", flag: "🇪🇸"),
    LanguageModel(name: "French", flag: "🇫🇷"),
    LanguageModel(name: "German", flag: "🇩🇪"),
    LanguageModel(name: "Italian", flag: "🇮🇹"),
    LanguageModel(name: "Portuguese", flag: "🇵🇹"),
    LanguageModel(name: "Russian", flag: "🇷🇺"),
    LanguageModel(name: "Chinese", flag: "🇨🇳"),
    LanguageModel(name: "Japanese", flag: "🇯🇵"),
    LanguageModel(name: "Korean", flag: "🇰🇷"),
    LanguageModel(name: "Turkish", flag: "🇹🇷"),
    LanguageModel(name: "Hindi", flag: "🇮🇳"),
    LanguageModel(name: "Dutch", flag: "🇳🇱"),
    LanguageModel(name: "Swedish", flag: "🇸🇪"),
  ];
}
