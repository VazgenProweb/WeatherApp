import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_update/domain/api/weather_api.dart';
import 'package:weather_app_update/domain/json_to_dart/coords.dart';
import 'package:weather_app_update/domain/providers/weather_data_provider.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';
import 'package:weather_app_update/ui/widgets/const.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherDataProvider>();
    final title = model.timeZone;
    final data = DateFormat('EEEEEE  hh:mm  a', 'ru').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(width: 40),
              TextButton.icon(
                onPressed: null,
                label: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.textColor,
                    fontSize: 22,
                    height: 1.1,
                    letterSpacing: -0.41,
                  ),
                  textAlign: TextAlign.center,
                ),
                icon: SvgPicture.asset(AppIcons.location),
              ),
              IconButton(
                onPressed: () async {
                  Coords? cords = await WeatherApi.getCoords('Tashkent');
                  borderPrint(cords?.lat);
                },
                icon: const Icon(Icons.add),
                splashRadius: 20,
                color: AppTheme.textColor,
              ),
            ],
          ),
          Text(
            capitalize(data),
            style: TextStyle(
              fontSize: 14,
              height: 1.57,
              letterSpacing: -0.41,
              color: AppTheme.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
