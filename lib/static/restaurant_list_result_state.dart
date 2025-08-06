import '../data/model/restaurant.dart';

sealed class RestaurantResultState {}

class RestaurantNoneState extends RestaurantResultState {}

class RestaurantLoadingState extends RestaurantResultState {}

class RestaurantErrorState extends RestaurantResultState {
  final String error;

  RestaurantErrorState(this.error);
}

class RestaurantLoadedState extends RestaurantResultState {
  final List<Restaurant> data;

  RestaurantLoadedState(this.data);
}
