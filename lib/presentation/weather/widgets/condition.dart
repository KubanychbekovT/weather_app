class Weather {
  String _getWeatherConditionAsset(String condition) {
    switch (condition) {
      case 'Cloudy':
        return 'assets/images/cloudy.svg';
      case 'Windy':
        return 'assets/images/windy.svg';
      case 'Sunny':
        return 'assets/images/sunny.svg';
      case 'Storm':
        return 'assets/images/storm.svg';
      case 'Snow':
        return 'assets/images/snow.svg';
      case 'Rain':
        return 'assets/images/rain.svg';
      default:
        return 'assets/images/cloudy.svg';
    }
  }
}
