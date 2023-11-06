

import '../../../../../Core/service_locator/service_locator.dart';
import '../data_sources/Product_api.dart';
import '../models/Product_response.dart';

class ProductRepository {
  final _categoriesApi = ServiceLocator.instance<ProductApi>();

  Future<ProductResponse> getProduct(id) {
    return _categoriesApi.getProduct(id);
  }

}
