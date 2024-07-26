import 'package:restaurant_api_dicoding/api/restaurant/api_restaurant.dart';
import 'package:restaurant_api_dicoding/models/restaurant_detail.dart';
import '../../models/restaurant.dart';

class ApiRepository {
  final ApiRestaurant _restaurantApi = ApiRestaurant();

  Future<RestaurantModel> listRestaurant() async {
    try {
      return await _restaurantApi.listRestaurant();
    } catch (e) {
      // Handle error appropriately
      return RestaurantModel(error: true, message: 'Failed to fetch restaurants');
    }
  }

  Future<RestaurantDetail> getDetailRestaurant(String id) async {
    try {
      return await _restaurantApi.getRestaurantDetail(id);
    } catch (e) {
      // Handle error appropriately
      return RestaurantDetail(id: id,);
    }
  }
}
