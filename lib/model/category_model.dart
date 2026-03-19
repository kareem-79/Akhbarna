import 'package:akhbarna/core/resources/assets_managers.dart';

class CategoryModel {
  final String name;
  final String image;
  bool isSelected;

  CategoryModel({
    required this.name,
    required this.image,
    this.isSelected = false,
  });

  static final List<CategoryModel> categories = [
    CategoryModel(name: "محلي", image: CategoryImageManagers.local),
    CategoryModel(name: "رياضة", image: CategoryImageManagers.sports),
    CategoryModel(name: "اقتصاد", image: CategoryImageManagers.economy),
    CategoryModel(name: "الصحة", image: CategoryImageManagers.health),
    CategoryModel(name: "الفن", image: CategoryImageManagers.art),
    CategoryModel(name: "سياسة", image: CategoryImageManagers.policy),
    CategoryModel(name: "تكنولوجيا", image: CategoryImageManagers.technology),
    CategoryModel(name: "التعليم", image: CategoryImageManagers.education),
  ];
}
