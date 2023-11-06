

import '../../data/models/home_response.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class FavoriteResultsUpdated extends HomeState {

  final  List<Product> response;

  FavoriteResultsUpdated(this.response);}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final HomeResponse response;

  HomeLoaded(this.response);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

