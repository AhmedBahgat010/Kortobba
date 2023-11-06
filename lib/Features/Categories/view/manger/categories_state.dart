


import '../../data/models/Categories_response.dart';

sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final CategoriesResponse response;

  CategoriesLoaded(this.response);
}

final class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}

