import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import '../data/repository/weather_repo.dart';
import '../models/weather_model.dart';


class WeatherController extends ChangeNotifier{
  WeatherRepository weatherRepo = WeatherRepository();

  Future<WeatherModel> weatherByLatLonCtl(double lat, double lon) async {
    WeatherModel myWeather = WeatherModel();
    try {
      Response response = await weatherRepo.weatherByLatLonRepo(lat, lon);
      myWeather =
          WeatherModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return myWeather;

  }
  WeatherModel? weatherData;
  bool? isLoading;
  List myItems = [];
  Position? position;

  getLatLon() async {
    try {
      position = await Geolocator.getCurrentPosition();
      double latitude = position!.latitude;
      double longitude = position!.longitude;
      getWeatherByLatLon(latitude, longitude);
      isLoading = false;
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }

        isLoading = false;
      notifyListeners();
    }
  }

  getWeatherByLatLon(double lat, double lon) async {
    WeatherController weatherController = WeatherController();
    WeatherModel weatherModel =
    await weatherController.weatherByLatLonCtl(lat, lon);
    if (weatherModel.cod == 200) {

        weatherData = weatherModel;
        myItems = [
          ["FEELS LIKE", weatherData!.main!.feelsLike, "feels_like.png"],
          ["TEMP MIN", weatherData!.main!.tempMin, "low-temperature.png"],
          ["TEMP MAX", weatherData!.main!.tempMax, "high-temperature.png"],
          ["PRESSURE", weatherData!.main!.pressure, "pressure.png"],
          ["HUMIDITY", weatherData!.main!.humidity, "humidity.png"],
          ["WIND SPEED", weatherData!.wind!.speed, "wind.png"]
        ];
        isLoading = false;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print("error");
      }

        isLoading = false;
      notifyListeners();
    }
  }

}
