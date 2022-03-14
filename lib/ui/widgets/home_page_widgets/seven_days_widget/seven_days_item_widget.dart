import 'package:flutter/material.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';

class SevenDaysItemWidget extends StatelessWidget {
  final String day;
  final String icon;
  final String dayTemp;
  final String nightTemp;

  const SevenDaysItemWidget({
    Key? key,
    this.day = 'Сегодня',
    this.icon = AppIcons.cloudy,
    this.dayTemp = '0',
    this.nightTemp = '0',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: 125,
          child: Text(
            day,
            style: TextStyle(
              fontSize: 20,
              height: 1.1,
              color: AppTheme.textColor,
              letterSpacing: -0.41,
            ),
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: Image.network(
            icon,
            color: AppTheme.textColor,
          ),
        ),
        SizedBox(
          width: 100,
          child: _DayNightTemp(dayTemp: dayTemp, nightTemp: nightTemp),
        ),
      ],
    );
  }
}

class _DayNightTemp extends StatelessWidget {
  final String dayTemp;
  final String nightTemp;

  const _DayNightTemp({
    Key? key,
    required this.dayTemp,
    required this.nightTemp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$dayTemp℃',
          style: TextStyle(
            fontSize: 20,
            height: 1.1,
            color: AppTheme.textColor,
            letterSpacing: -0.41,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          '$nightTemp℃',
          style: TextStyle(
            fontSize: 20,
            height: 1.1,
            color: AppTheme.valueColor,
            letterSpacing: -0.41,
          ),
        ),
      ],
    );
  }
}
