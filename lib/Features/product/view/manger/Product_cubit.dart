import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Product_response.dart';
import '../../data/repositories/Product_repository.dart';
import 'Product_state.dart';

// Cubit class for managing the state of the product screen
class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  // Instance of the product repository for fetching product data
  final homeRepository = ProductRepository();
  ProductResponse? productResponse;

  // Method to fetch product data by ID
  Future<void> getProduct(id) async {
    try {
      emit(ProductLoading());
      // Fetch product data from the repository
      final response = await homeRepository.getProduct(id);
      productResponse = response;
      print(productResponse);

      // Emit the loaded state with the product data
      emit(ProductLoaded(response));
    } catch (error) {
      // Handle errors, particularly DioError in this case
      if (error is DioError) {
        final response = error.response;
        print(response!.data["detail"]);
        emit(ProductError(response.data["detail"].toString()));
      }
    }
  }
}
