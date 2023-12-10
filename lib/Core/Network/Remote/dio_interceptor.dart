import 'package:dio/dio.dart';
import 'package:kortobaa_task/app_router.dart';
import '../../../Features/auth/data/repositories/auth_repository.dart';
import '../../../Features/auth/presentaion/view/login_screen.dart';
import '../../service_locator/service_locator.dart';
import '../Local/cache_keys.dart';
import '../Local/cache_storage.dart';
class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = ServiceLocator.instance<CacheStorage>().getData(
      key: CacheKeys.accessToken,
    ) as String?;

    options.headers['Authorization'] =
        "JWT $accessToken"; // options.headers['Authorization'] = accessToken;

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 498 ) {
      print(err.response?.statusCode);
      final loggedOut = await AuthRepository().logout();
      if (loggedOut) {
        AppRouter.navigatorKey.currentState!.pushNamedAndRemoveUntil(
          LoginScreen.routeName,
          (route) => false,
        );
      }
    }

    super.onError(err, handler);
  }
}
