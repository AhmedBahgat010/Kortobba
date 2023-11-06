import '../../../../Core/Network/Local/cache_keys.dart';
import '../../../../Core/Network/Local/cache_storage.dart';
import '../../../../Core/service_locator/service_locator.dart';
import '../data_sources/auth_api.dart';

class AuthRepository {
  final _authApi = ServiceLocator.instance<AuthApi>();


  Future<void> login({
    required String username,
    required String password,
  }) async {
    final response = await _authApi.login(
      username: username,
      password: password,
    );
    final cacheStorage = ServiceLocator.instance<CacheStorage>();

    await Future.wait([
      cacheStorage.setData<bool>(
        key: CacheKeys.rememberAccount,
        value: true,
      ),
      cacheStorage.setData<String>(
        key: CacheKeys.accessToken,
        value: response.access!,
      ),
    ]);
  }

  Future<void> register({
    required String username,
    required String lastName,
    required String firstName,
    required String email,
    required String password,
  }) async {
    final response = await _authApi.register(
      email: email,
      firstName: firstName,
      lastName: lastName,
      username: username,
      password: password,
    );

  }

  Future<bool> logout() async {
    final cacheStorage = ServiceLocator.instance<CacheStorage>();

    final result = await Future.wait([
      cacheStorage.removeData(key: CacheKeys.rememberAccount),
      cacheStorage.removeData(key: CacheKeys.accessToken),
    ]);

    return result.every((futureResult) => futureResult == true);
  }

}
