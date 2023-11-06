


import 'package:dartz/dartz.dart';
import 'package:kortobaa_task/Features/auth/data/models/login_response.dart';
import 'package:kortobaa_task/Features/auth/data/models/registration_response.dart';

import '../../../../Core/Network/Remote/dio_exception.dart';

abstract class AuthApi {
  Future<LoginResponse>  login({
    required String username,
    required String password,
  });
  Future<RegistrationResponse > register({
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  });

}