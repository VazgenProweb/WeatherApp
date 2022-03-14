import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_update/domain/json_to_dart/weather_data.dart';
import 'package:weather_app_update/domain/providers/weather_data_provider.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/pages/home_page/home_page_appbar.dart';
import 'package:weather_app_update/ui/pages/home_page/home_page_body/home_page_body.dart';
import 'package:weather_app_update/ui/pages/home_page/home_page_header/home_page_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildBody(
    BuildContext context,
    AsyncSnapshot<WeatherData?> snapshot,
  ) {
    switch (snapshot.connectionState) {
      case ConnectionState.done:
        return const _HomePageContent();
      case ConnectionState.waiting:
      default:
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppGifs.splashScreen),
              fit: BoxFit.cover,
            ),
          ),
          constraints: const BoxConstraints.expand(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<WeatherDataProvider>().setUp(),
        builder: _buildBody,
      ),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherDataProvider>();

    return Stack(
      children: [
        Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              repeat: ImageRepeat.repeat,
              image: AssetImage(model.getCurentWeatherState),
              fit: BoxFit.cover,
            ),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
          ),
        ),
        SafeArea(
          child: Column(
            children: <Widget>[
              const HomePageAppBar(),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.00),
                  children: const [
                    HomePageHeader(),
                    HomePageBody(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
