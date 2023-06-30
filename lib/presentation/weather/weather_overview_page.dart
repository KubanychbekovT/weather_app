import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather/application/services/weather_api_client.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/presentation/forecast/forecast_page.dart';
import 'package:weather/presentation/core/widgets/search.dart';
import 'package:weather/presentation/weather/widgets/condition.dart';
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
  String weatherImage = 'assets/images/sunny.svg';
  String weatherText = '';
  bool isDarkMode = false;

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
    fetchData(selectedCity);
  }


  void fetchData(String city) async {
    Weather? weather = await client.getCurrentWeather(city);
    setState(() {
      data = weather;
      weatherImage = WeatherStatus().getWeatherIcon(weather?.condition ?? '');
      weatherText = weather?.condition ?? '';
    });
  }

  void onCitySelected(String city) {
    setState(() {
      selectedCity = city; // Update the selected city
    });
    fetchData(selectedCity); // Fetch weather data for the selected city
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
          backgroundColor: Theme.of(context).backgroundColor,
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
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              selectedCity,
                              style: TextStyle(
                                  color: Color(0xff3d4a73),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Spacer(),
                    Switch(
                      value: context.isDarkMode,
                      onChanged: (value) {
                        context.isDarkMode ? AdaptiveTheme.of(context).setLight() : AdaptiveTheme.of(context).setDark();
                      },
                    ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xfff7d153),
                          ),
                          child: Icon(Icons.person),
                        ),

                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    weatherImage,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 300,
                  ),
                   SizedBox(height: 20),
                  // Text(
                  //   weatherText,
                  //   style: TextStyle(fontSize: 35, color: Colors.black26),
                  // ),
                  // SizedBox(height: 20),
                  FutureBuilder<Weather?>(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                weatherStatWidget(
                                    "Wind", "${snapshot.data!.wind}"),
                                Container(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
                                weatherStatWidget(
                                    "Temp", "${snapshot.data!.temp}°C"),
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
                            final serverFailure =
                                snapshot.error as ServerFailure;
                            return Text('Error: ${serverFailure.error}');
                          } else {
                            return Text('Error: ${snapshot.error}');
                          }
                        } else {
                          return Text(
                            'city not found',
                            style: TextStyle(color: Colors.red),
                          );
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(height: 40),
                  Search(onCitySelected: onCitySelected),
                  SizedBox(height: 100),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ForecastPage(
                                          selectedCity: selectedCity),
                                    )),
                                child: Row(
                                  children: [
                                    Text(
                                      'Next 7 Days',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    color:  Theme.of(context).primaryColor,
                    child: HourlyWeather(
                      selectedCity: selectedCity,
                    ),
                  ),
                ],
              ),
            );
  }
}
