import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_update/domain/providers/weather_data_provider.dart';
import 'package:weather_app_update/ui/widgets/home_page_widgets/card_widget/card_widget.dart';
import '../widgets_data.dart';
import 'package:flutter/cupertino.dart';

class BlockCardWidget extends StatelessWidget implements HomePageBodyWidgets {
  const BlockCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherDataProvider>();


    return ConstrainedBox(
      constraints:const BoxConstraints(maxWidth: 400),
      child: GridView.builder(
        // cacheExtent: 400,
        padding: const EdgeInsets.symmetric(vertical: 28),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 181,
          mainAxisExtent: 160,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, i) {
          return const CardWidget();
        },
      ),
    );
  }
}
