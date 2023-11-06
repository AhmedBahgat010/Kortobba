
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Categories_response.dart';
import '../../data/repositories/Categories_repository.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  final homeRepository = CategoriesRepository();
  CategoriesResponse? categoriesResponse;
  Future<void> getCategories() async {
    try {
      emit(CategoriesLoading());
      final response = await homeRepository.getCategories();
      categoriesResponse = response;
      emit(CategoriesLoaded(response));
    } catch (error) {
      print(error.toString());

      emit(CategoriesError(error.toString()));
    }
  }

}
