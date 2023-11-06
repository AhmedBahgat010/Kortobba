

import '../../../../../Core/service_locator/service_locator.dart';
import '../data_sources/home_api.dart';
import '../models/home_response.dart';

class HomeRepository {
  final _homeApi = ServiceLocator.instance<HomeApi>();

  Future<HomeResponse> getHome() {
    return _homeApi.getHome();
  }

}
