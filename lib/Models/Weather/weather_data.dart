import 'package:meteo_direct/Models/Weather/weather_data_current.dart';
import 'package:meteo_direct/Models/Weather/weather_data_daily.dart';
import 'package:meteo_direct/Models/Weather/weather_data_hourly.dart';

//Class principale de récupération des données
class WeatherData{

  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current,this.hourly,this.daily]);

  //Fonction pour récupérer les valeurs
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather()=>hourly!;
  WeatherDataDaily getDailyWeather()=>daily!;
}