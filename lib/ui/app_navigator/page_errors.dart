import 'package:flutter/material.dart';
import 'package:weather_app_update/resources/resources.dart';

import 'app_routes.dart';

abstract class PageErrors {
  static Route get error404 {
    return MaterialPageRoute(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.home,
              (route) => false,
            );
          },
          child: Scaffold(
            backgroundColor: const Color(0xff323232),
            body: SafeArea(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  AppGifs.giphy,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
