

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_api_dicoding/api/restaurant/api_repository.dart';
import 'package:restaurant_api_dicoding/log/logger.dart';
import 'package:restaurant_api_dicoding/models/restaurant.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetListRestaurant>((event, emit) async {
      try{
        emit(RestaurantLoading());
        final mList = await apiRepository.listRestaurant();
        emit(RestaurantLoaded(mList));
        if(mList.error != false){
          emit(RestaurantError(mList.message));
        }

      }on RestaurantError{
        LoggerGlobal.logger.e('Failed to fetch data. is your device online?');
        emit(const RestaurantError('Failed to fetch data. is your device online?'));
      }
    });
  }
}
