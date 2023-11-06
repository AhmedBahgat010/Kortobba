



import '../models/home_response.dart';

abstract class HomeApi {
  Future<HomeResponse> getHome();
}
