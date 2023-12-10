



sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartItemsLoading extends CartState {}
final class UpdateItemCountState extends CartState {}

final class GetCartItemsLoaded extends CartState {

}
final class removeItemLoaded extends CartState {

  late final   String message;

  removeItemLoaded(this.message);
}

final class CartError extends CartState {
  final String message;
  CartError(this.message);
}

