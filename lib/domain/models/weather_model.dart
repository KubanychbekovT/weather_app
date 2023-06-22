class Weather {
  String? city;
  double? wind;
  double? temp;
  int? humidity;
  String? condition;

  Weather({
    this.city,
    this.wind,
    this.temp,
    this.humidity,
    this.condition,
  });

  Weather.fromJson(Map<String, dynamic> json){
    city = json['name'];
    wind = json['wind']['speed'];
    temp = json['main']['temp'];
    humidity = json['main']['humidity'];
  }
}