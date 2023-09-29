import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = 'dc253fb9c4fa77ec2ceaef64984c1667';
const apiaddress = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(var cityname) async {
    var url = '$apiaddress?q=$cityname&appid=$apikey&units=metric';
    networkHelper networkhelper = networkHelper(url);
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getlocationWeather() async {
    Location currentloaction = Location();
    await currentloaction.getLocation();
    networkHelper networkhelper = networkHelper(
        '$apiaddress?lat=${currentloaction.latitude}&lon=${currentloaction.longitude}&appid=$apikey&units=metric');
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
