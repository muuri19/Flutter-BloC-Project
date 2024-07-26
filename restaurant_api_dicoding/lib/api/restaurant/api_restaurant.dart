import 'package:dio/dio.dart';
import 'package:restaurant_api_dicoding/log/logger.dart';
import 'package:restaurant_api_dicoding/models/restaurant_detail.dart';
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
      LoggerGlobal.logger.e('Error fetching restaurant list: $error');
      return RestaurantModel(error: true, message: 'Failed to fetch restaurant list');
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      Response response = await _dio.get('$_baseUrl/detail/$id');
      final dataApiRestaurant = RestaurantDetail.fromJson(response.data);
      LoggerGlobal.logger.i(dataApiRestaurant);
      return dataApiRestaurant;
    } catch (error) {
      LoggerGlobal.logger.e('Error fetching restaurant detail: $error');
      return RestaurantDetail(id: id,);
    }
  }
}
