import 'package:api/Model/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherService {
  Future<String?> _getLocation() async {
    //Kullanıcının konumu açık mı
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Future.error("Your Location Service Is Turned Off");
    }

    //Kullanıcı konum izni vermiş mi
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      //Konum izni vermişse tekrar izin isteği
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error("Give Location Permission");
      }
    }

    //Kullanıcı pozisyonu
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //Kullanıcı pozisyonundan yerleşim konumunu bulma
    final List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    //Şehrin yerleşim noktasını kaydetme
    final String? city = placeMark[0].administrativeArea;
    if (city == null) Future.error("There Is A Problem");

    return city;
  }

  Future<List<Weather>?> getWeatherData() async {
    final String? city = await _getLocation();

    final String url =
        'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city';
    const Map<String, dynamic> headers = {
      "authorization": "apikey 4I8DBYg8ETDeJrEZwwa0Pl:3Ht4IwjahVH2H75O2ecEDa",
      "content-type": "application/json"
    };

    final dio = Dio();

    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode != 200) {
      return Future.error("There Is A Problem");
    }
    final list = response.data['result'];

    if (list is List) {
      final weatherList = list.map((e) => Weather.fromJson(e)).toList();
      return weatherList;
    }
    return null;
  }
}
