import 'package:flutter/material.dart';
import 'package:weather_app_update/ui/app_navigator/app_routes.dart';
import 'package:weather_app_update/ui/app_navigator/page_errors.dart';
import 'package:weather_app_update/ui/pages/home_page/home_page.dart';
import 'package:weather_app_update/ui/pages/search_page/search_page.dart';

class AppNavigator {
  static String get initionalRoute => AppRoutes.home;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (_) => const HomePage(),
        AppRoutes.search: (_) => const SearchPage(),
      };

  static Route<dynamic> onGenerateroute(RouteSettings settings) {
    return PageErrors.error404;
  }

  }
