

import 'package:restaurant_api_dicoding/api/restaurant/api_restaurant.dart';
import '../../models/restaurant.dart';

class ApiRepository {
  final _restaurantApi = ApiRestaurant();

  Future<RestaurantModel> listRestaurant (){
    return _restaurantApi.listRestaurant();
  }

}

class NetworkError extends Error{}