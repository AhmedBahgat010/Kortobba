

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kortobaa_task/Features/Categories/data/data_sources/Categories_api.dart';
import 'package:kortobaa_task/Features/Categories/data/data_sources/dio_Categories_api.dart';
import 'package:kortobaa_task/Features/home/presentaion/data/data_sources/home_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/auth/data/data_sources/auth_api.dart';
import '../../Features/auth/data/data_sources/dio_auth_api.dart';
import '../../Features/home/presentaion/data/data_sources/dio_home_api.dart';
import '../../Features/product/data/data_sources/Product_api.dart';
import '../../Features/product/data/data_sources/dio_Product_api.dart';
import '../Network/Local/cache_storage.dart';
import '../Network/Local/shared_prefs_cache.dart';
import '../Network/Remote/dio_interceptor.dart';
import '../Utils/Api Constances.dart';
import '../Utils/snackbars.dart';
import '../Utils/top_snackbars.dart';
class ServiceLocator {
  ServiceLocator._();

  static final instance = GetIt.instance;

  static Future<void> setup() async {
    // * Cache Storage
    final prefs = await SharedPreferences.getInstance();
    instance.registerSingleton<CacheStorage>(SharedPrefsCache(prefs) as CacheStorage);

    // * Dio
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstances.baseUrl,
        validateStatus: (status) => status == 200,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    dio.interceptors.addAll([
      DioInterceptor(),
      PrettyDioLogger(
        requestBody: true,
      )
    ]);
    instance.registerLazySingleton<Dio>(() => dio);

    // * Snackbars
    instance.registerLazySingleton<Snackbars>(() => TopSnackbars());
    //
    // // * Apis

    instance.registerLazySingleton<AuthApi>(() => DioAuthApi());
    instance.registerLazySingleton<HomeApi>(() => DioHomeApi());
    instance.registerLazySingleton<CategoriesApi>(() => DioCategoriesApi());
    instance.registerLazySingleton<ProductApi>(() => DioProductApi());



    //

  }
}
