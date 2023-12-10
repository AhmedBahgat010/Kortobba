import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Cart/data/models/CartProductModel.dart';
import '../../data/models/home_response.dart';
import '../../data/repositories/home_repository.dart';
import 'home_state.dart';

// Cubit class for managing the state of the home screen
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Index for managing the current selected tab
  int currentIndex = 0;

  // Key for accessing the cart data in SharedPreferences
  static const String key = 'cart';

  // Add item to cart
  Future<void> addItemToCart(CartProduct product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItems = prefs.getStringList(key) ?? [];
    bool itemExists = false;

    for (int i = 0; i < cartItems.length; i++) {
      Map<String, dynamic> map = jsonDecode(cartItems[i]);
      CartProduct itemProduct = CartProduct.fromMap(map);

      if (itemProduct.title == product.title) {
        // Item already exists, update its count
        itemProduct.count += 1;
        cartItems[i] = jsonEncode(itemProduct.toMap());
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      // Item doesn't exist in the cart, add it
      cartItems.add(jsonEncode(product.toMap()));
    }

    prefs.setStringList(key, cartItems);
    emit(AddItemCart("تم اضافة المنتج للسلة بنجاح"));
  }

  // Update the current selected tab index
  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    emit(IndexUpdated(currentIndex));
  }

  // Instance of the home repository for fetching home data
  final homeRepository = HomeRepository();
  HomeResponse? homeResponse;
  List<Product> allProducts = [];

  // List to store the products marked as favorites from the home screen
  List<Product> favoriteResults = [];

  // Method to toggle the favorite status of a product
  void toggleFavorite(int productId) {
    if (favoriteResults.any((product) => product.id == productId)) {
      favoriteResults.removeWhere((product) => product.id == productId);
    } else {
      Product productToAdd =
      allProducts.firstWhere((product) => product.id == productId);
      favoriteResults.add(Product(
          id: productToAdd.id,
          name: productToAdd.name,
          image: productToAdd.image,
          price: productToAdd.price));
    }

    print("toggleFavorite ${favoriteResults.length}");
    emit(FavoriteResultsUpdated(favoriteResults));
  }

  // Method to fetch home data
  Future<void> getHome() async {
    try {
      emit(HomeLoading());
      final response = await homeRepository.getHome();
      homeResponse = response;
      print(homeResponse!.results?[1].name);

      emit(HomeLoaded(response));
    } catch (error) {
      if (error is DioError) {
        final response = error.response;
        print(response!.data["detail"]);
        emit(HomeError(response.data["detail"].toString()));
      }
    }
  }
}
