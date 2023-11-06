

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kortobaa_task/Core/Network/Remote/api_exception.dart';
import 'package:kortobaa_task/Core/Network/Remote/base_response.dart';
import 'package:kortobaa_task/Core/Network/Remote/locale_keys.g.dart';
import 'package:logger/logger.dart';

mixin SafeApiRequest {
  Future<Response> safeApiRequest(
    Future<Response> Function() function,
  ) async {
    try {

      final response = await function();

      final parsedResponse = BaseResponse.fromJson(response.data);
      print(BaseResponse.fromJson(response.data).result.code);

      if (parsedResponse.result.code != 200) {
        throw ApiException(parsedResponse.result.message);

      }
      return response;
    } on DioException catch (error) {
     final parsedResponse = BaseResponse.fromJson(error.response!.data);
print(parsedResponse.result.code);
      // final  parsedResponse= ServerFailure.fromDioError(error);
     throw ApiException(parsedResponse.result.message);
    } on ApiException {
      rethrow;
    } catch (error) {
      print(error.toString());

      Logger().e(error);
      throw LocaleKeys.genericErrorMessage.tr();
    }
  }
}
