import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/Product_response.dart';
import '../../data/repositories/Product_repository.dart';
import 'Product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final homeRepository = ProductRepository();
  ProductResponse? productResponse;

  Future<void> getProduct(id) async {
    try {
      emit(ProductLoading());
      final response = await homeRepository.getProduct(id);
      productResponse = response;
print(productResponse);
      emit(ProductLoaded(response));
    } catch (error) {
      print(error.toString());

      emit(ProductError(error.toString()));
    }
  }
}
