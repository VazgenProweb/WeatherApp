import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_update/domain/api/weather_api.dart';
import 'package:weather_app_update/domain/json_to_dart/coords.dart';
import 'package:weather_app_update/domain/json_to_dart/weather_data.dart';
import 'package:weather_app_update/resources/resources.dart';
import 'package:weather_app_update/ui/themes/app_theme.dart';
import 'package:weather_app_update/ui/widgets/const.dart';

class WeatherDataProvider extends ChangeNotifier {
  static Coords? _coords;
  static WeatherData? _weatherData;

  WeatherDataProvider() {
    setUp();
  }

  Coords? get coords => _coords;
  WeatherData? get weatherData => _weatherData;

  Future<WeatherData?> setUp({String cityName = 'Ташкент'}) async {
    _coords = await WeatherApi.getCoords(cityName);
    _weatherData = await WeatherApi.getWeather(_coords);
    setOpions();

    await Future.delayed(const Duration(milliseconds: 2500));
    notifyListeners();

    return _weatherData;
  }

  String _curentWeatherState = AppGifs.splashScreen;
  String get getCurentWeatherState => _curentWeatherState;

  List<Daily> _daily = [];
  List<Daily> get daily => _daily;

  String _timeZone = 'Ташкент';
  String get timeZone => _timeZone;

  Current _current = Current();
  Current get current => _current;
  
  // DateTime _dateTime = DateTime.now();
  // DateTime get current => _current;

  final List<String> _date = [];
  List<String> get date => _date;



  void setOpions() {
    try {
      _current = _weatherData!.current!;
      int id = _current.weather![0].id!;
      _timeZone = _weatherData!.timezone!;
      _daily = _weatherData!.daily!;

      for (var i = 0; i < _daily.length; i++) {
        if (i == 0 && _date.isNotEmpty) _date.clear();
        if (i == 0) {
          _date.add('Сегодня');
        } else {


          
          var timeNum = (_daily[i].dt ?? 0) * 1000;
          var itemDate = DateTime.fromMillisecondsSinceEpoch(timeNum);
          _date.add(capitalize(DateFormat('EEEE', 'ru').format(itemDate)));
        }
      }

      if (_current.sunset! > _current.dt!) {
        if (id >= 200 && id <= 531) {
          _curentWeatherState = Bg.rainBg;
          AppTheme.textColor = const Color(0xff030708);
          AppTheme.valueColor = const Color(0xff002C25);
          AppTheme.clearBoxBg = const Color.fromRGBO(106, 141, 135, 0.5);
        } else if (id >= 600 && id <= 622) {
          _curentWeatherState = Bg.snowBg;
          AppTheme.textColor = const Color(0xff030708);
          AppTheme.valueColor = const Color(0xff00263E);
          AppTheme.clearBoxBg = const Color.fromRGBO(109, 160, 192, 0.5);
        } else if (id >= 701 && id <= 781) {
          _curentWeatherState = Bg.fogBg;
          AppTheme.textColor = const Color(0xff323232);
          AppTheme.valueColor = const Color(0xffD8D8D8);
          AppTheme.clearBoxBg = const Color.fromRGBO(142, 141, 141, 0.5);
        } else if (id == 800) {
          _curentWeatherState = Bg.clearBg;
          AppTheme.textColor = const Color(0xff002535);
          AppTheme.valueColor = const Color(0xffffffff);
          AppTheme.clearBoxBg = const Color.fromRGBO(80, 130, 155, 0.3);
        } else if (id >= 801 && id <= 804) {
          _curentWeatherState = Bg.cloudyBg;
          AppTheme.textColor = const Color(0xff001C39);
          AppTheme.valueColor = const Color(0xffFFFFFF);
          AppTheme.clearBoxBg = const Color.fromRGBO(140, 155, 170, 0.5);
        }
      } else {
        if (id >= 200 && id <= 531) {
          _curentWeatherState = Bg.rainNightBg;
          AppTheme.textColor = const Color(0xffC6C6C6);
          AppTheme.valueColor = const Color(0xffffffff);
          AppTheme.clearBoxBg = const Color.fromRGBO(35, 35, 35, 0.5);
        } else if (id >= 600 && id <= 622) {
          _curentWeatherState = Bg.snowNightBg;
          AppTheme.textColor = const Color(0xffE6E6E6);
          AppTheme.valueColor = const Color(0xffF9DADA);
          AppTheme.clearBoxBg = const Color.fromRGBO(12, 23, 27, 0.5);
        } else if (id >= 701 && id <= 781) {
          _curentWeatherState = Bg.fogNightBg;
          AppTheme.textColor = const Color(0xffffffff);
          AppTheme.valueColor = const Color(0xff999999);
          AppTheme.clearBoxBg = const Color.fromRGBO(35, 35, 35, .5);
        } else if (id == 800) {
          _curentWeatherState = Bg.clearNightBg;
          AppTheme.textColor = const Color(0xffffffff);
          AppTheme.valueColor = const Color(0xff51DAFF);
          AppTheme.clearBoxBg = const Color.fromRGBO(47, 97, 148, 0.5);
        } else if (id >= 801 && id <= 804) {
          _curentWeatherState = Bg.cloudyNightBg;
          AppTheme.textColor = const Color(0xffE2E2E2);
          AppTheme.valueColor = const Color(0xff7E8386);
          AppTheme.clearBoxBg = const Color.fromRGBO(12, 23, 27, 0.5);
        }
      }
    } catch (e) {
      borderPrint(e);
    }
  }
}
