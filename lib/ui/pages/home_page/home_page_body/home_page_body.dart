import 'package:flutter/material.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/card_widget/block_card_widget.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/card_widget/card_big_widget.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/seven_days_widget/seven_days_widget.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/widgets_data.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <HomePageBodyWidgets>[
        const SevenDaysWidget(),
        const BlockCardWidget(),
        CardBigWidget(
          data: CardBigWidgetData(
            itemOne: CardBigWidgetItemData(
              icon: AppIcons.sunrise
            ),
            itemTwo: CardBigWidgetItemData(
              icon: AppIcons.sunset,
              subtitle: 'Закат',
            ),
          ),
        ),
      ],
    );
  }
}
