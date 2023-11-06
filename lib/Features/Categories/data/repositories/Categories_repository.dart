

import '../../../../../Core/service_locator/service_locator.dart';
import '../data_sources/Categories_api.dart';
import '../models/Categories_response.dart';

class CategoriesRepository {
  final _categoriesApi = ServiceLocator.instance<CategoriesApi>();

  Future<CategoriesResponse> getCategories() {
    return _categoriesApi.getCategories();
  }

}
