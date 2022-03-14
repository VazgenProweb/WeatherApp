import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_update/domain/providers/weather_data_provider.dart';
import 'package:weather_app_update/ui/pages/home_page/home_page_header/home_page_min_max.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';
import 'package:weather_app_update/ui/widgets/const.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherDataProvider>();
    const kelvin = -273.15;

    final currentTemp = (model.current.temp ?? -kelvin) + kelvin;
    final minTemp = (model.daily[0].temp?.min ?? -kelvin) + kelvin;
    final maxTemp = (model.daily[0].temp?.max ?? -kelvin) + kelvin;
    final description = model.current.weather?[0].description ?? 'Ясно';

    const _iconUrlPath = 'http://openweathermap.org/img/wn/';
    final iconName = model.current.weather?[0].icon ?? '01d';

    return Container(
      margin: const EdgeInsets.only(bottom: 40, top: 28),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 52,
                height: 52,
                child: Image.network(
                  _iconUrlPath + iconName + '@2x.png',
                  color: AppTheme.textColor,
                ),
              ),
              Text(
                capitalize(description),
                style: TextStyle(
                  color: AppTheme.textColor,
                  fontSize: 16,
                  height: 1.37,
                  letterSpacing: -.41,
                ),
              )
            ],
          ),
          Text(
            '${currentTemp.round()}℃',
            style: TextStyle(
              letterSpacing: -.41,
              fontSize: 90,
              color: AppTheme.textColor,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HomePageMinMax.max(deg: maxTemp.round()),
              const SizedBox(width: 65),
              HomePageMinMax.min(deg: minTemp.round()),
            ],
          ),
        ],
      ),
    );
  }
}
