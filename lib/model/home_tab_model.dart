import 'package:flutter/material.dart';

class HomeTabModel {
  String id;
  String name;

  HomeTabModel({
    required this.id,
    required this.name
  });

  static List<HomeTabModel> homeTabList(BuildContext context) {
    return [
      HomeTabModel(id: '1', name: "عاجل"),
      HomeTabModel(id: '2', name: "اخر الأخبار"),
      HomeTabModel(id: '3', name: "الأكثر قراءة"),
    ];
  }
}
