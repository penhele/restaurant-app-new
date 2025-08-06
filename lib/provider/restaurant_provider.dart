import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../static/restaurant_list_result_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantProvider(this._apiServices);

  RestaurantResultState _resultState = RestaurantNoneState();

  RestaurantResultState get resultState => _resultState;

  Future<void> fetchRestaurantList() async {
    try {
      _resultState = RestaurantLoadingState();
      notifyListeners();

      final result = await _apiServices.getRestaurantList();

      if (result.error) {
        _resultState = RestaurantErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = RestaurantLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantErrorState(e.toString());
      notifyListeners();
    }
  }
}
