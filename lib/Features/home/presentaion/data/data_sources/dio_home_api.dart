
import 'package:dio/dio.dart';
import 'package:kortobaa_task/Core/Network/Remote/safe_api_request.dart';
import 'package:kortobaa_task/Features/home/presentaion/data/data_sources/home_api.dart';
import 'package:kortobaa_task/Features/home/presentaion/data/models/home_response.dart';

import '../../../../../Core/service_locator/service_locator.dart';

class DioHomeApi extends HomeApi with SafeApiRequest {
  final _dio = ServiceLocator.instance<Dio>();

  @override
  Future<HomeResponse> getHome() async {
    final request = _dio.get('/api/v1/products/', data: {});

    // final response = await safeApiRequest(() => request);
    final response = await request;
    return HomeResponse.fromJson(response.data);
  }

}
