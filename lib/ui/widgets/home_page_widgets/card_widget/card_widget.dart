import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';
import 'package:weather_app_update/ui/widgets/blur_container.dart';

import 'card_widget_units.dart';

class CardWidget extends StatelessWidget {
  final String icon;
  final String subtitle;
  final double value;
  final CardWidgetUnits units;

  const CardWidget({
    Key? key,
    this.icon = AppIcons.windSpeed,
    this.subtitle = 'Скорость ветра',
    this.units = CardWidgetUnits.kmh,
    this.value = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String valueTxt = CardWidgetUnitsTreatment.unitsTreatment(units, value);

    return BlurContainer(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(icon, color: AppTheme.textColor,),
            const SizedBox(width: 11.5),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  valueTxt,
                  style:  TextStyle(
                    color: AppTheme.valueColor,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style:  TextStyle(
                    color: AppTheme.textColor,
                    fontSize: 12,
                    height: 2.2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
