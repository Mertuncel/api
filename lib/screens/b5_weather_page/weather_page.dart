import 'package:api/Model/weather_model.dart';
import 'package:api/service/weather_service.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  List<Weather>? _weathers = [];
  bool loading = false;

  void isLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void getWeatherData() async {
    isLoading();
    _weathers = await WeatherService().getWeatherData();
    setState(() {});
    isLoading();
  }

  @override
  void initState() {
    getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("WEATHER"),
          centerTitle: true,
        ),
        body: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _weathers?.length,
                itemBuilder: (context, index) {
                  final Weather weather = _weathers![index];
                  return Column(
                    children: [
                      weatherItems(
                          size,
                          weather.icon ?? '',
                          weather.day ?? '',
                          weather.min ?? '',
                          weather.night ?? '',
                          weather.max ?? '',
                          weather.humidity ?? '',
                          'ANKARA'),
                    ],
                  );
                },
              ));
  }

  Widget weatherItems(
    Size size,
    String img,
    String day,
    String min,
    String night,
    String max,
    String nem,
    String city,
  ) {
    return Container(
        height: size.height * 0.25,
        width: size.width * 0.90,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(city),
            const SizedBox(
              height: 6,
            ),
            Image.network(
              img,
              width: 100,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(day),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Min:  $min'),
                  Text('Gece:  $night'),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Max:  $max'),
                  Text('Nem:  $nem'),
                ],
              ),
            ),
          ],
        ));
  }
}
