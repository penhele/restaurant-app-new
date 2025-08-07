import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'controllers/theme_controller.dart';
import 'data/api/api_service.dart';
import 'navigation_menu.dart';
import 'provider/restaurant_provider.dart';
import 'utils/theme/theme.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());

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
    final themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      themeMode: themeController.theme,
      theme: SAppTheme.lightTheme,
      darkTheme: SAppTheme.darkTheme,
      home: const NavigationMenu(),
    );
  }
}
