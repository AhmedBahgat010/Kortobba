import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Categories_response.dart';
import '../../data/repositories/Categories_repository.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  // Create an instance of CategoriesRepository
  final homeRepository = CategoriesRepository();

  // Holds the response from the API
  CategoriesResponse? categoriesResponse;

  // Fetch categories from the repository
  Future<void> getCategories() async {
    try {
      emit(CategoriesLoading());

      // Fetch categories from the repository
      final response = await homeRepository.getCategories();

      // Save the response for later use
      categoriesResponse = response;

      // Notify the UI that loading is complete and pass the response
      emit(CategoriesLoaded(response));
    } catch (error) {
      // Handle errors during the API call
      if (error is DioError) {
        final response = error.response;
        // Notify the UI about the error with a message
        emit(CategoriesError(response!.data["detail"].toString()));
      }
    }
  }
}