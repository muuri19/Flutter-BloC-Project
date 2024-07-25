import 'package:dio/dio.dart';
import 'package:restaurant_api_dicoding/log/logger.dart';
import '../../models/restaurant.dart';

class ApiRestaurant {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantModel> listRestaurant() async {
    try {
      Response response = await _dio.get('$_baseUrl/list');
      final dataApiRestaurant = RestaurantModel.fromJson(response.data);
      LoggerGlobal.logger.i(dataApiRestaurant);
      return dataApiRestaurant;
    } catch (error) {
      return RestaurantModel(error: true);
    }
  }
}
