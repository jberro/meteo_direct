import 'dart:ui';

import 'package:get/get.dart';
import 'package:meteo_direct/Models/Utilisateur.dart';
import 'package:meteo_direct/Models/Weather/weather_data.dart';
import 'package:meteo_direct/api/fetch_weather.dart';

class GlobalController extends GetxController {
  //Création d'utilisateur bouchon
  final Utilisateur user =
      new Utilisateur("Jad", "jad.berro@outlook.com", "sncf");

  //Coordonnée de Paris
  RxDouble _lattitude = 48.82917276077073.obs;
  RxDouble _longitude = 2.344133236604668.obs;

  //Définition des codes couleur de référence
  final PrimaryColor = Color(0xFF00579D);
  final SecondaryColor = Color(0xFF72C0FF);

  //Variable de chargement
  RxBool _isLoading = false.obs;

  //Class de récupération des données météo
  final weatherData = WeatherData().obs;

  WeatherData getWeatherData() {
    return weatherData.value;
  }

  //Fonctions
  RxBool checkLoading() => _isLoading;

  RxDouble getLattitude() => _lattitude;

  RxDouble getLongitide() => _longitude;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  //Appel de l'Api
  getData() async {
    _isLoading.value = true;
    return FetchWeatherApi().processData(_lattitude, _longitude).then((value) {
      weatherData.value = value;
      _isLoading.value = false;
      print(_isLoading.value);
    });
  }
}
