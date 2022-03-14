import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_update/domain/providers/weather_data_provider.dart';
import 'package:weather_app_update/ui/app_navigator/app_navigator.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherDataProvider(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''), // English, no country code
          Locale('ru', ''), // Spanish, no country code
        ],
        title: 'Приложение',
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        
        
        
        
        
        
        
        
        
//         проверка
        routes: AppNavigator.routes,
        initialRoute: AppNavigator.initionalRoute,
        onGenerateRoute: AppNavigator.onGenerateroute,
      ),
    );
  }
}
