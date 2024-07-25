part of 'restaurant_bloc.dart';
abstract class RestaurantState extends Equatable{
  const RestaurantState();

  @override
  List<Object?> get props => [];
}

final class RestaurantInitial extends RestaurantState {}

final class RestaurantLoading extends RestaurantState {}

final class RestaurantLoaded extends RestaurantState {
  final RestaurantModel restaurantModel;
  const RestaurantLoaded(this.restaurantModel);
}

final class RestaurantError extends RestaurantState {
  final String? message;
  const RestaurantError(this.message);
}




