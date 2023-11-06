
import 'package:dio/dio.dart';
import 'package:kortobaa_task/Core/Network/Remote/safe_api_request.dart';
import 'package:kortobaa_task/Features/Categories/data/data_sources/Categories_api.dart';
import 'package:kortobaa_task/Features/home/presentaion/data/data_sources/home_api.dart';
import 'package:kortobaa_task/Features/home/presentaion/data/models/home_response.dart';

import '../../../../../Core/service_locator/service_locator.dart';
import '../models/Categories_response.dart';

class DioCategoriesApi extends CategoriesApi with SafeApiRequest {
  final _dio = ServiceLocator.instance<Dio>();

  @override
  Future<CategoriesResponse> getCategories() async {
    final request = _dio.get('/api/v1/categories/', data: {});

    // final response = await safeApiRequest(() => request);
    final response = await request;
    return CategoriesResponse.fromJson(response.data);
  }

}
