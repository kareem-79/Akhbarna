import '../../data/models/CategoriesResponseModel.dart';

abstract class CategoryNewsState {}

class CategoryNewsInitial extends CategoryNewsState {}

class CategoryNewsLoading extends CategoryNewsState {}

class CategoryNewsSuccess extends CategoryNewsState {
  CategoriesResponseModel categoriesResponse;

  CategoryNewsSuccess({required this.categoriesResponse});
}

class CategoryNewsError extends CategoryNewsState {
  String message;

  CategoryNewsError({required this.message});
}
