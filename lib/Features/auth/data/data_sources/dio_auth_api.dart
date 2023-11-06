import 'package:dio/dio.dart';
import 'package:kortobaa_task/Features/auth/data/data_sources/auth_api.dart';
import 'package:kortobaa_task/Features/auth/data/models/login_response.dart';
import 'package:kortobaa_task/Features/auth/data/models/registration_response.dart';

import '../../../../Core/Network/Remote/safe_api_request.dart';
import '../../../../Core/service_locator/service_locator.dart';



class DioAuthApi extends AuthApi with SafeApiRequest{
  final _dio = ServiceLocator.instance<Dio>();

  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {

    final request = _dio.post(
      '/users/login/',
      data: {

          'username': username,
          'password': password,

      },

    );

    // final response = await safeApiRequest(()=> request);
    final response = await request;


    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<RegistrationResponse> register({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  }) async {

    final request = _dio.post(
      '/users/register/',
      data: {
        "username": username,
        "password": password,
        "email": email,
        "first_name":firstName,
        "last_name": lastName

      },
    );

    // final response = await safeApiRequest(()=> request);
    final response = await request;

    return RegistrationResponse.fromJson(response.data);
  }


}