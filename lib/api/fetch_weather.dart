import 'dart:convert';

import 'package:meteo_direct/Models/Weather/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:meteo_direct/Models/Weather/weather_data_current.dart';
import 'package:meteo_direct/Models/Weather/weather_data_daily.dart';
import 'package:meteo_direct/Models/Weather/weather_data_hourly.dart';
import 'package:meteo_direct/api/api_key.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  //récupération des données
  Future<WeatherData> processData(lat, lng) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lng)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }
}

//Url de la requette openweather
String apiUrl(var lat, var lng) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lng&appid=$apikey&units=metric&exclude=minutely&lang=fr";
  return url;
}
