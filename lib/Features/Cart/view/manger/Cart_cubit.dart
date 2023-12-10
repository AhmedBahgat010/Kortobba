import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kortobaa_task/Features/Cart/data/models/CartProductModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static const String key = 'cart';

  List<CartProduct> products = [];

  // Get items from cart

  Future<List<CartProduct>> getCartItems() async {
    emit(GetCartItemsLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cartItems = prefs.getStringList(key) ?? [];

    products = [];

    for (String item in cartItems) {
      Map<String, dynamic> map = jsonDecode(item);
      products.add(CartProduct.fromMap(map));
    }
    emit(GetCartItemsLoaded());
    return products;
  }

  // Remove item from cart
  Future<void> removeItemFromCart(CartProduct product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cartItems = prefs.getStringList(key) ?? [];

    cartItems.removeWhere((item) {
      Map<String, dynamic> map = jsonDecode(item);
      CartProduct itemProduct = CartProduct.fromMap(map);
      return itemProduct.title ==
          product.title; // Customize this comparison based on your requirements
    });

    prefs.setStringList(key, cartItems);

    emit(removeItemLoaded("Item remove to cart successfully"));
  }

  // Update item count in cart
  Future<List<CartProduct>> updateItemCount(CartProduct product, int newCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cartItems = prefs.getStringList(key) ?? [];

    for (int i = 0; i < cartItems.length; i++) {
      Map<String, dynamic> map = jsonDecode(cartItems[i]);
      CartProduct itemProduct = CartProduct.fromMap(map);

      if (itemProduct.title == product.title) {
        itemProduct.count = newCount;
        cartItems[i] = jsonEncode(itemProduct.toMap());
        break;
      }
    }

    prefs.setStringList(key, cartItems);

    // Return the updated list of cart items and count
    List<CartProduct> updatedCart =
        cartItems.map((item) => CartProduct.fromMap(jsonDecode(item))).toList();
    products =updatedCart;
emit(UpdateItemCountState());
    return updatedCart;
  }

   double total =0.0;

  // Get total price of items in cart
  double getTotal() {
     total = 0.0; // Initialize total inside the method
    products.forEach((element) {
      total += element.count! * double.parse(element.price);

    });

    return total;
  }
}
