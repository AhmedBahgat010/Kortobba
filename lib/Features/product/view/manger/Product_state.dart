


import '../../data/models/Product_response.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final ProductResponse response;

  ProductLoaded(this.response);
}

final class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}

