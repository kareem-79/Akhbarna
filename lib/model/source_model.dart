import '../core/resources/assets_managers.dart';

class SourceModel {
  final String id;
  final String name;
  final String imagePath;
  bool isSelected;

  SourceModel({
    required this.id,
    required this.name,
    required this.imagePath,
    this.isSelected = false,
  });

  static final List<SourceModel> sources = [
    SourceModel(
      id: "BBC عربي",
      name: "BBC بالعربية",
      imagePath: SourceImageManagers.bbc,
    ),
    SourceModel(
      id: "الجزيرة",
      name: "الجزيرة",
      imagePath: SourceImageManagers.elgzira,
    ),
    SourceModel(
      id: "العربية",
      name: "العربية",
      imagePath: SourceImageManagers.elarabia,
    ),
    SourceModel(
      id: "SKY NEWS عربية",
      name: "SKY NEWS عربية",
      imagePath: SourceImageManagers.sky,
    ),
    SourceModel(
      id: "يورونيوز",
      name: "Euro News",
      imagePath: SourceImageManagers.euro,
    ),
    SourceModel(
      id: "CNN عربي",
      name: "CNN بالعربية",
      imagePath: SourceImageManagers.cnn,
    ),
    SourceModel(
      id: "الشرق",
      name: "الشرق",
      imagePath: SourceImageManagers.elShark,
    ),
    SourceModel(
      id: "RT عربية",
      name: "RT العربية",
      imagePath: SourceImageManagers.rt,
    ),
    SourceModel(
      id: "بوابة الاهرام",
      name: "بوابة الاهرام",
      imagePath: SourceImageManagers.elAhram,
    ),
    SourceModel(
      id: "الحدث",
      name: "الحدث",
      imagePath: SourceImageManagers.elHadas,
    ),
    SourceModel(
      id: "بوابة الفجر",
      name: "بوابة الفجر",
      imagePath: SourceImageManagers.elFagr,
    ),
    SourceModel(
      id: "اليوم السابع",
      name: "اليوم السابع",
      imagePath: SourceImageManagers.elYoumElSab3,
    ),
    SourceModel(
      id: "أخبار اليوم",
      name: "أخبار اليوم",
      imagePath: SourceImageManagers.akhbarElYoum,
    ),
    SourceModel(
      id: "المصري اليوم",
      name: "المصري اليوم",
      imagePath: SourceImageManagers.elMasry,
    ),
    SourceModel(
      id: "الشروق",
      name: "الشروق",
      imagePath: SourceImageManagers.elShrouk,
    ),
    SourceModel(
      id: "فرانس 24",
      name: "فرانس 24",
      imagePath: SourceImageManagers.france24,
    ),
  ];
}
