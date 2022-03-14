import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_update/domain/json_to_dart/weather_data.dart';
import 'package:weather_app_update/domain/providers/weather_data_provider.dart';
import 'package:weather_app_update/ui/widgets/blur_container.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/seven_days_widget/seven_days_item_widget.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/widgets_data.dart';


class SevenDaysWidget extends StatelessWidget implements HomePageBodyWidgets {
  const SevenDaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherDataProvider>();
    final List<Daily> daily = model.daily;
    final List<String> date = model.date;
    const kelvin = -273.15;
    const _iconUrlPath = 'http://openweathermap.org/img/wn/';

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: BlurContainer(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 34,
          ),
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 0),
          itemCount: 7,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            final _dayTemp = (daily[i].temp?.day ?? -kelvin) + kelvin;
            final _nightTemp = (daily[i].temp?.night ?? -kelvin) + kelvin;
            final iconName = daily[i].weather?[0].icon ?? '01d';

            return SevenDaysItemWidget(
              day: date[i],
              dayTemp: _dayTemp.round().toString(),
              nightTemp: _nightTemp.round().toString(),
              icon: _iconUrlPath + iconName + '@2x.png',
            );
          },
        ),
      ),
    );
  }
}
