class Weather {
  String? city;
  double? wind;
  double? temp;
  int? humidity;

  Weather({
    this.city,
    this.wind,
    this.temp,
    this.humidity});

  Weather.fromJson(Map<String, dynamic> json){
    city = json['name'];
    wind = json['wind']['speed'];
    temp = json['main']['temp'];
    humidity = json['main']['humidity'];
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:weather/application/services/weather_api_client.dart';
// import 'package:weather/domain/models/weather_model.dart';
// import 'package:weather/presentation/search/search.dart';
// import 'package:weather/presentation/weather/widgets/hourly_details.dart';
//
// class WeatherOverviewPage extends StatefulWidget {
//   const WeatherOverviewPage({super.key});
//
//   @override
//   State<WeatherOverviewPage> createState() => _WeatherOverviewPageState();
// }
//
// class _WeatherOverviewPageState extends State<WeatherOverviewPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   WeatherApiClient client = WeatherApiClient();
//   Weather? data;
//
//   Future<void> getData() async {
//     data = await client.getCurrentWeather('Bishkek');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _tabController.addListener(_handleTabSelection);
//   }
//
//
//   void _handleTabSelection() {
//     if (_tabController.index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SearchPage()),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }
//
//   Widget weatherStatWidget(String characteristic, String value) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             characteristic,
//             style: const TextStyle(
//                 color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
//           ),
//           Text(
//             value,
//             style: const TextStyle(
//                 color: Color(0xff323e61),
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffecf3fe),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 24,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Today, 13 June",
//                       style: TextStyle(
//                           color: Colors.grey, fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       "Bishkek",
//                       style: TextStyle(
//                           color: Color(0xff3d4a73),
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: const Color(0xfff7d153)),
//                     child: const Icon(Icons.person))
//               ],
//             ),
//           ),
//           SvgPicture.asset(
//             "assets/images/cloudy.svg",
//             fit: BoxFit.contain,
//             width: double.infinity,
//             height: 300,
//           ),
//           const SizedBox(height: 20),
//           const Text(
//             'Windy',
//             style: TextStyle(fontSize: 35, color: Colors.black26),
//           ),
//           const SizedBox(height: 20),
//           FutureBuilder(
//             future: getData(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return SizedBox(
//                   height: 50,
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       weatherStatWidget("Wind", "${data!.wind}"),
//                       Container(
//                         width: 0.5,
//                         color: Colors.grey,
//                       ),
//                       weatherStatWidget("Temp", "${data!.temp}"),
//                       Container(
//                         width: 0.5,
//                         color: Colors.grey,
//                       ),
//                       weatherStatWidget("Humidity", "${data!.humidity}"),
//                     ],
//                   ),
//                 );
//               } else {
//                 return const CircularProgressIndicator();
//               }
//             },
//           ),
//
//           const SizedBox(height: 100),
//           Expanded(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: const EdgeInsets.all(25),
//               decoration: const BoxDecoration(
//                 color: Color(0xff5a1bee),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(35),
//                   topRight: Radius.circular(35),
//                 ),
//               ),
//               child: const Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Today',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       Text(
//                         'Next 7 Days',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//               color: const Color(0xff5a1bee), child: const HourlyWeather()),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         color: const Color(0xff5a1bee),
//         height: 140,
//         padding: const EdgeInsets.all(24),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(
//             Radius.circular(30.0),
//           ),
//           child: Container(
//             color: Colors.white,
//             child: TabBar(
//               controller: _tabController,
//               labelColor: Colors.black54,
//               unselectedLabelColor: Colors.black54,
//               labelStyle: const TextStyle(fontSize: 10),
//               indicator: const UnderlineTabIndicator(
//                 //borderRadius: BorderSide(color: Colors.black54, width: 0.0),
//                   insets: EdgeInsets.fromLTRB(
//                     50,
//                     0,
//                     50,
//                     48,
//                   )),
//               indicatorColor: Colors.black54,
//               tabs: const <Widget>[
//                 Tab(
//                   text: 'Home',
//                   icon: Icon(Icons.home_outlined),
//                 ),
//                 Tab(
//                   text: 'Search',
//                   icon: Icon(Icons.search_outlined),
//                 ),
//                 Tab(
//                   text: 'Settings',
//                   icon: Icon(Icons.settings_outlined),
//                 ),
//               ],
//             ),
//
//           ),
//         ),
//       ),
//     );
//   }
// }







// class SearchPage extends StatefulWidget {
//   final String selectedCity;
//
//   const SearchPage({super.key, required this.selectedCity});
//
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   TextEditingController _searchController = TextEditingController();
//   WeatherApiClient client = WeatherApiClient();
//   Weather? weather;
//
//   void searchCity(String city) async {
//     setState(() {
//       weather = null;
//     });
//
//     if (city.isNotEmpty) {
//       Weather? result = await client.getCurrentWeather(city);
//
//       setState(() {
//         weather = result;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         Navigator.popUntil(context, ModalRoute.withName('/'));
//         return false;
//       },
//       child: Scaffold(
//         backgroundColor: Color(0xffecf3fe),
//         appBar: AppBar(
//           backgroundColor: Color(0xff5a1bee),
//           title: Text('Search'),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _searchController,
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//                 textInputAction: TextInputAction.search,
//                 onSubmitted: (value) {
//                   searchCity(value);
//                 },
//                 decoration: InputDecoration(
//                   suffix: IconButton(
//                     icon: Icon(
//                       Icons.search,
//                       color: Colors.black,
//                     ),
//                     onPressed: () {
//                       searchCity(_searchController.text);
//                     },
//                   ),
//                   hintStyle: TextStyle(color: Colors.black),
//                   hintText: 'Search'.toUpperCase(),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               if (weather != null)
//                 Column(
//                   children: [
//                     Text(
//                       weather!.city ?? '',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Temp: ${weather!.temp}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Wind: ${weather!.wind}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Humidity: ${weather!.humidity}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }