import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/restaurant_provider.dart';
import '../../static/restaurant_list_result_state.dart';
import 'restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _fetchRestaurantList() {
    Future.microtask(() {
      context.read<RestaurantProvider>().fetchRestaurantList();
    });
  }

  @override
  void initState() {
    super.initState();

    _fetchRestaurantList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Consumer<RestaurantProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            RestaurantLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),

            RestaurantLoadedState(data: var restaurantList) => ListView.builder(
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];

                return RestaurantCard(restaurant: restaurant);
              },
            ),

            RestaurantErrorState(error: var message) => Text(message),

            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
