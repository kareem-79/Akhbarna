import 'package:akhbarna/core/resources/assets_managers.dart';

class CategoryTabModel {
  String id;
  String imageBath;
  String title;

  CategoryTabModel({
    required this.id,
    required this.imageBath,
    required this.title,
  });
  static List<CategoryTabModel> categories = [
    CategoryTabModel(
      id: "international",
      imageBath: CategoryTabImageManagers.international,
      title: 'International',
    ),
    CategoryTabModel(
      id: "economy",
      imageBath: CategoryTabImageManagers.economy,
      title: 'Economy',
    ),
    CategoryTabModel(
      id: "sports",
      imageBath: CategoryTabImageManagers.sport,
      title: 'Sports',
    ),
    CategoryTabModel(
      id: "politics",
      imageBath: CategoryTabImageManagers.politics,
      title: "Politics",
    ),
    CategoryTabModel(
      id: "health",
      imageBath: CategoryTabImageManagers.health,
      title: 'Health',
    ),
    CategoryTabModel(
      id: "art",
      imageBath: CategoryTabImageManagers.art,
      title: 'Art',
    ),
  ];
}
