import '../core/resources/assets_managers.dart';

class SourceModel {
  final String name;
  final String imagePath;
  bool isSelected;
  SourceModel({required this.name, required this.imagePath, this.isSelected = false});
  static final List<SourceModel> sources = [
    SourceModel(name: "BBC بالعربية", imagePath: SourceImageManagers.bbc),
    SourceModel(name: "الجزيرة", imagePath: SourceImageManagers.elgzira),
    SourceModel(name: "العربية", imagePath: SourceImageManagers.elarabia),
    SourceModel(name: "SKY NEWS عربية", imagePath: SourceImageManagers.sky),
    SourceModel(name: "Euro News", imagePath: SourceImageManagers.euro),
    SourceModel(name: "CNN بالعربية", imagePath: SourceImageManagers.cnn),
    SourceModel(name: "الشرق", imagePath: SourceImageManagers.elShark),
    SourceModel(name: "RT العربية", imagePath: SourceImageManagers.rt),
    SourceModel(name: "بوابة الاهرام", imagePath: SourceImageManagers.elAhram),
    SourceModel(name: "الحدث", imagePath: SourceImageManagers.elHadas),
    SourceModel(name: "بوابة الفجر", imagePath: SourceImageManagers.elFagr),
    SourceModel(name: "اليوم السابع", imagePath: SourceImageManagers.elYoumElSab3),
    SourceModel(name: "أخبار اليوم", imagePath: SourceImageManagers.akhbarElYoum),
    SourceModel(name: "المصري اليوم", imagePath: SourceImageManagers.elMasry),
    SourceModel(name: "الشروق", imagePath: SourceImageManagers.elShrouk),
  ];
}


