
import 'package:dio/dio.dart';
import 'package:kortobaa_task/Core/Network/Remote/safe_api_request.dart';
import 'package:kortobaa_task/Features/product/data/data_sources/Product_api.dart';


import '../../../../../Core/service_locator/service_locator.dart';
import '../models/Product_response.dart';

class DioProductApi extends ProductApi with SafeApiRequest {
  final _dio = ServiceLocator.instance<Dio>();

  @override
  Future<ProductResponse> getProduct(id) async {
    final request = _dio.get('/api/v1/products/$id', data: {});

    // final response = await safeApiRequest(() => request);
    final response = await request;
    final productList = (response.data as List<dynamic>)
        .map((item) => ProductResponse.fromJson(item))
        .toList();
    return productList[0];
  }

}
