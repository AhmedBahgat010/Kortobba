
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/home_response.dart';
import '../../data/repositories/home_repository.dart';
import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final homeRepository = HomeRepository();
  HomeResponse? homeResponse;
  List<Product> allProducts = [
  ];
  List<Product> favoriteResults = [];
  void toggleFavorite(int productId) {
    if (favoriteResults.any((product) => product.id == productId)) {
      favoriteResults.removeWhere((product) => product.id == productId);
    } else {
      Product productToAdd = allProducts.firstWhere((product) => product.id == productId);
      favoriteResults.add(Product(productToAdd.id, productToAdd.name));
    }

    print("toggleFavorite ${favoriteResults.length}");
    print("favoriteResults.length");
    emit(FavoriteResultsUpdated(favoriteResults )); // Emit a new state if needed
  }


  Future<void> getHome() async {
    try {
      emit(HomeLoading());
      final response = await homeRepository.getHome();
      homeResponse = response;
      print(homeResponse!.results?[1].name);

      emit(HomeLoaded(response));
    } catch (error) {
      print(error.toString());

      emit(HomeError(error.toString()));
    }
  }


}
