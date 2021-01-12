import '../services/location.dart';
import '../services/networking.dart';
import 'networking.dart';

const API_KEY = "2ebb56d6e85e160b18c1c13c139e9c79";
const api_url = "http://api.openweathermap.org/data/2.5/weather?lat=";

class WeatherModel {
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

  Future<dynamic> getCityWeather(String cityName) async {
    var url =  "api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$API_KEY&units=metric";
    NetworkService networkservice = NetworkService(url);

    var getWeatherData = await networkservice.getData();
    return getWeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkService networkService = NetworkService(
        '$api_url?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric');
    // Function here zodat getData na get Location komt

    var weatherData = await networkService.getData();

    return weatherData;
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
