import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';
import 'package:weather_app_update/ui/widgets/blur_container.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/widgets_data.dart';

class CardBigWidget extends StatelessWidget implements HomePageBodyWidgets {
  final CardBigWidgetData data;

  const CardBigWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: BlurContainer(
          child: Padding(
            padding: const EdgeInsets.all(41),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <CardBigWidgetItem>[
                CardBigWidgetItem(item: data.itemOne),
                CardBigWidgetItem(item: data.itemTwo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardBigWidgetItem extends StatelessWidget {
  final CardBigWidgetItemData item;

  const CardBigWidgetItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(item.icon, color: AppTheme.textColor,),
        const SizedBox(height: 20),
        Text(
          '${item.subtitle} ${item.value}',
          style:  TextStyle(
            color: AppTheme.valueColor,
            height: 1.375,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class CardBigWidgetData {
  CardBigWidgetItemData itemOne = CardBigWidgetItemData();
  CardBigWidgetItemData itemTwo = CardBigWidgetItemData();

  CardBigWidgetData({
    required this.itemOne,
    required this.itemTwo,
  });
}

class CardBigWidgetItemData {
  String subtitle;
  double value;
  String icon;

  CardBigWidgetItemData({
    this.icon = AppIcons.cloudy,
    this.value = 0,
    this.subtitle = 'Восход',
  });
}
