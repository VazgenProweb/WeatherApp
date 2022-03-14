import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';

class HomePageMinMax extends StatelessWidget {
  final String icon;
  final int deg;

  const HomePageMinMax.min({Key? key, this.deg = 0})
      : icon = AppIcons.min,
        super(key: key);

  const HomePageMinMax.max({Key? key, this.deg = 0})
      : icon = AppIcons.max,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    String txt = deg < 10 && deg > 0 ? '0$deg°' : '$deg°';

    if (deg > -10 && deg < 0) txt = '-0${-deg}°';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset(icon),
        const SizedBox(width: 4),
        Text(
          txt,
          style:  TextStyle(
            color: AppTheme.textColor,
            fontSize: 25,
            letterSpacing: -.41,
          ),
        ),
      ],
    );
  }
}
