import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/application/services/weather_api_client.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/presentation/search/search.dart';
import 'package:weather/presentation/weather/widgets/hourly_details.dart';
import '../../domain/core/failures.dart';
import 'widgets/weather_stat.dart';

class WeatherOverviewPage extends StatefulWidget {
  const WeatherOverviewPage({Key? key}) : super(key: key);

  @override
  _WeatherOverviewPageState createState() => _WeatherOverviewPageState();
}

class _WeatherOverviewPageState extends State<WeatherOverviewPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  String selectedCity = 'Bishkek';

  Future<Weather?> getData() async {
    return client.getCurrentWeather(selectedCity);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    fetchData(selectedCity);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void fetchData(String city) async {
    Weather? weather = await client.getCurrentWeather(city);
    setState(() {
      data = weather;
    });
  }

  void onCitySelected(String city) {
    setState(() {
      selectedCity = city; // Обновление выбранного города
    });
    fetchData(selectedCity); // Обновление погодных данных
  }

  String _getMonthName(int month) {
    final months = [
      '', // Пустая строка для компенсации индексации, так как месяцы в DateTime начинаются с 1
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecf3fe),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today, ${DateTime.now().day} ${_getMonthName(DateTime.now().month)}",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      selectedCity,
                      style: const TextStyle(
                          color: Color(0xff3d4a73),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xfff7d153)),
                    child: const Icon(Icons.person))
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/images/cloudy.svg",
            fit: BoxFit.contain,
            width: double.infinity,
            height: 300,
          ),
          const SizedBox(height: 20),
          const Text(
            'Windy',
            style: TextStyle(fontSize: 35, color: Colors.black26),
          ),
          const SizedBox(height: 20),
          FutureBuilder<Weather?>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  double? kelvin = snapshot.data!.temp;
                  double celsius = kelvin! - 273.15;
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        weatherStatWidget("Wind", "${snapshot.data!.wind}"),
                        Container(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        weatherStatWidget("Temp", "$celsius°C"),
                        Container(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        weatherStatWidget(
                            "Humidity", "${snapshot.data!.humidity}"),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  if (snapshot.error is ServerFailure) {
                    final serverFailure = snapshot.error as ServerFailure;
                    return Text('Error: ${serverFailure.error}');
                  } else {
                    return Text('Error: ${snapshot.error}');
                  }
                }
                else {
                  return const Text('{"cod":"404","message":"city not found"}');
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          SizedBox(height: 20),
          Search(onCitySelected: onCitySelected),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Color(0xff5a1bee),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        'Next 7 Days',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
              color: const Color(0xff5a1bee), child: const HourlyWeather()),
        ],
      ),
      bottomNavigationBar: Container(
        color: const Color(0xff5a1bee),
        height: 140,
        padding: const EdgeInsets.all(24),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black54,
              unselectedLabelColor: Colors.black54,
              labelStyle: const TextStyle(fontSize: 10),
              indicator: const UnderlineTabIndicator(
                insets: EdgeInsets.fromLTRB(
                  50,
                  0,
                  50,
                  48,
                ),
              ),
              indicatorColor: Colors.black54,
              tabs: const <Widget>[
                Tab(
                  text: 'Home',
                  icon: Icon(Icons.home_outlined),
                ),
                Tab(
                  text: 'Settings',
                  icon: Icon(Icons.settings_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
