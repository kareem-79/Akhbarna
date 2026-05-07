import '../core/resources/assets_managers.dart';

class TopNewsModel {
  final String image;
  final String title;
  final String source;
  final String sourceTitle;
  final String time;
  final bool isBreaking;

  TopNewsModel({
    required this.image,
    required this.title,
    required this.source,
    required this.time,
    required this.sourceTitle,
    this.isBreaking = false,
  });


}
List<TopNewsModel> topNewsList = [
  TopNewsModel(
    image: ImageManagers.news5,
    title:
    "بعد إيقاف رئيسه فيرون إستوديانتس يتوج بلقب المرحلة الختامية بالدوري الأرجنتيني",
    source: SourceImageManagers.elShrouk,
    time: "منذ 20 دقيقة",
    isBreaking: true,
    sourceTitle: 'جريدة الشروق',
  ),
  TopNewsModel(
    image: ImageManagers.news5,
    title:
    "بعد إيقاف رئيسه فيرون إستوديانتس يتوج بلقب المرحلة الختامية بالدوري الأرجنتيني",
    source: SourceImageManagers.sky,
    time: "منذ 2 دقيقة",
    isBreaking: true,
    sourceTitle: 'سكاي نيوز عربية',
  ),
  TopNewsModel(
    image: ImageManagers.news5,
    title: "بعد إيقاف رئيسه فيرون إستوديانتس يتوج بلقب المرحلة الختامية بالدوري الأرجنتيني",
    source: SourceImageManagers.elgzira,
    sourceTitle: "الجزيرة نت",
    time: "منذ 22 دقيقة",
    isBreaking: true,
  ),
  TopNewsModel(
    image: ImageManagers.news5,
    title:
    "بعد إيقاف رئيسه فيرون إستوديانتس يتوج بلقب المرحلة الختامية بالدوري الأرجنتيني",
    source: SourceImageManagers.elShrouk,
    time: "منذ 20 دقيقة",
    isBreaking: true,
    sourceTitle: 'جريدة الشروق',
  ),
  TopNewsModel(
    image: ImageManagers.news5,
    title:
    "بعد إيقاف رئيسه فيرون إستوديانتس يتوج بلقب المرحلة الختامية بالدوري الأرجنتيني",
    source: SourceImageManagers.sky,
    time: "منذ 2 دقيقة",
    isBreaking: true,
    sourceTitle: 'سكاي نيوز عربية',
  ),
  TopNewsModel(
    image: ImageManagers.news5,
    title: "بعد إيقاف رئيسه فيرون إستوديانتس يتوج بلقب المرحلة الختامية بالدوري الأرجنتيني",
    source: SourceImageManagers.elgzira,
    sourceTitle: "الجزيرة نت",
    time: "منذ 22 دقيقة",
    isBreaking: true,
  ),
];
