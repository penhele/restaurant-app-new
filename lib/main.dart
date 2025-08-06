import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/api/api_service.dart';
import 'navigation_menu.dart';
import 'provider/restaurant_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(context.read<ApiServices>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NavigationMenu(),
    );
  }
}
