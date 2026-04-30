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
    image: ImageManagers.news2,
    title:
    "تسريب مائي يتلف مئات مجلدات الحضارة المصرية في متحف اللوفر… فما الذي حدث؟",
    source: SourceImageManagers.cnn,
    time: "منذ 20 دقيقة",
    isBreaking: true,
    sourceTitle: 'CNN بالعربية',
  ),
  TopNewsModel(
    image: ImageManagers.news3,
    title:
    "كيف أثارت مباراة في كأس العالم غضباً في مصر وإيران بسبب الاحتفال بالمثليين؟",
    source: SourceImageManagers.sky,
    time: "منذ 2 دقيقة",
    isBreaking: true,
    sourceTitle: 'سكاي نيوز',
  ),
  TopNewsModel(
    image: ImageManagers.news3,
    title: "4 شهداء و10 إصابات في غزة والأمطار تعيق عمليات الإسعاف",
    source: SourceImageManagers.elgzira,
    sourceTitle: "الجزيرة نت",
    time: "منذ 22 دقيقة",
    isBreaking: true,
  ),
];
