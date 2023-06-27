// class Weather {
//   String _getWeatherConditionAsset(String condition) {
//     switch (condition) {
//       case 'Cloudy':
//         return 'assets/images/cloudy.svg';
//       case 'Windy':
//         return 'assets/images/windy.svg';
//       case 'Sunny':
//         return 'assets/images/sunny.svg';
//       case 'Storm':
//         return 'assets/images/storm.svg';
//       case 'Snow':
//         return 'assets/images/snow.svg';
//       case 'Rain':
//         return 'assets/images/rain.svg';
//       default:
//         return 'assets/images/cloudy.svg';
//     }
//   }
// }

// class WeatherStatus {
//   String getWeatherIcon(int temp) {
//     if (temp < 10) {
//       return 'assets/images/snowy.svg';
//     } else if (temp < 20) {
//       return 'assets/images/rainy.svg';
//     } else if (temp < 30) {
//       return 'assets/images/cloudy.svg';
//     } else {
//       return 'assets/images/sunny.svg';
//     }
//   }
//
//   String getMessage(int temp) {
//     if (temp > 25) {
//       return 'It\'s 🍦 time';
//     } else if (temp > 20) {
//       return 'Time for shorts and 👕';
//     } else if (temp < 10) {
//       return 'You\'ll need 🧣 and 🧤';
//     } else {
//       return 'Bring a 🧥 just in case';
//     }
//   }
// }
class WeatherStatus {
  String getWeatherIcon(String condition) {
    switch (condition) {
      case 'thunderstorm':
        return 'assets/sorm.svg';
      case 'rain':
        return 'assets/images/rainy.svg';
      case 'snow':
        return 'assets/images/snowy.svg';
      case 'windy':
        return 'assets/images/windy.svg';
      case 'cloudy':
        return 'assets/images/cloudy.svg';
      default:
        return 'assets/images/sunny.svg';
    }
  }


}
