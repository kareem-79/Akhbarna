import '../core/resources/assets_managers.dart';

class CategoryTabModel {
  final String id;
  final String imagePath;
  final String title;

  CategoryTabModel({
    required this.id,
    required this.imagePath,
    required this.title,
  });

  static List<CategoryTabModel> categories = [
    CategoryTabModel(
      id: "دولي",
      imagePath: CategoryTabImageManagers.international,
      title: "دولي",
    ),

    CategoryTabModel(
      id: "رياضة",
      imagePath: CategoryTabImageManagers.sport,
      title: "رياضة",
    ),

    CategoryTabModel(
      id: "اقتصاد",
      imagePath: CategoryTabImageManagers.economy,
      title: "اقتصاد",
    ),

    CategoryTabModel(
      id: "سياسة",
      imagePath: CategoryTabImageManagers.politics,
      title: "سياسة",
    ),

    CategoryTabModel(
      id: "تكنولوجيا",
      imagePath: CategoryTabImageManagers.technology,
      title: "تكنولوجيا",
    ),

    CategoryTabModel(
      id: "صحة",
      imagePath: CategoryTabImageManagers.health,
      title: "الصحة",
    ),

    CategoryTabModel(
      id: "فن",
      imagePath: CategoryTabImageManagers.entertainment,
      title: "ترفيه",
    ),

    CategoryTabModel(
      id: "علوم",
      imagePath: CategoryTabImageManagers.sciences,
      title: "علوم",
    ),
  ];
}