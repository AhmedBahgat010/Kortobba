





import '../models/Product_response.dart';

abstract class ProductApi {
  Future<ProductResponse> getProduct(id);
}
