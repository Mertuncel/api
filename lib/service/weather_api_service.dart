import 'package:api/Model/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherApi {
  // Coctails API service
  static const String _Url =
      'https://api.oceandrivers.com:443/v1.0/getAemetStation/aeropuertopalma/lastdata/';

  static Future<List<Weather>> fetchWeathers() async {
    List<Weather> _weatherDatas = [];

    var response = await Dio().get(_Url);

    var datas = response.data;
    
    
    if (datas is List) {
      _weatherDatas = datas.map((e) => Weather.fromJson(e)).toList();
    }
    return _weatherDatas;
  }
}
